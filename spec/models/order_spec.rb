require 'rails_helper'

RSpec.describe Order, type: :model do
  context "Associations" do
    it "should have many products" do
      order = Order.reflect_on_association(:products)
      expect(order.macro).to eq(:has_many)
    end
  end

  context "when validating an Order" do
    %w(items).each do |attr|
      it "must have an attribute '#{attr}'" do
        order = Fabricate.build(:order)
        order.send("#{attr}=",nil)
        expect(order.valid?).to be_falsey
      end
    end
  end

  context '#save_products_and_calculate_tax_total' do
    it 'should run as callback and save products and set total and taxes' do
      order = Order.new(items: "1, book, 15.0\n1, music CD, 10.0\n1, chocolate bar, 5.0")
      expect(order.total_sales_tax).to eq(nil)
      expect(order.total_price).to eq(nil)
      expect(order.save).to be_truthy
      expect(order.total_sales_tax).to eq(0.9)
      expect(order.total_price).to eq(30.0)
    end

    it 'should save order with correct products & total along with correct categories and taxes' do
      # Prepare hash from Seed data for testing purpose.
      categs = Category.all.select(:id, :name).inject({}) { |res, ele| res[ele.name] = ele.id; res  }
      order = Order.new(items: "1, imported box of chocolates, 10.50\r\n1, bottle of perfume, 54.65")
      expect(order.total_sales_tax).to eq(nil)
      expect(order.total_price).to eq(nil)
      expect(order.save).to be_truthy
      expect(order.total_sales_tax).to eq(5.45)
      expect(order.total_price).to eq(65.15)
      expect(order.products.size).to eq(2)
      pr1 = order.products.first
      expect(pr1.category_id).to eq(categs['Food'])
      expect(pr1.imported?).to be_truthy
      pr2 = order.products.last
      expect(pr2.category_id).to eq(categs['Others'])
      expect(pr2.imported?).to be_falsey
    end
  end
end
