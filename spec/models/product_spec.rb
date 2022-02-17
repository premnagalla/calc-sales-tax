require 'rails_helper'

RSpec.describe Product, type: :model do
  context "Associations" do
    it "should belong to category" do
      prod = Product.reflect_on_association(:category)
      expect(prod.macro).to eq(:belongs_to)
    end

    it "should belong to order" do
      prod =Product.reflect_on_association(:order)
      expect(prod.macro).to eq(:belongs_to)
    end
  end

  context "when validating an product" do
    %w(name order_id).each do |attr|
      it "must have an attribute '#{attr}'" do
        prod =Fabricate.build(:product)
        prod.send("#{attr}=",nil)
        expect(prod.valid?).to be_falsey
      end
    end
  end

  context '#imported?' do
    it 'should return true if name has imported text' do
      prod =Fabricate.build(:product, name: 'Imported Chocolates')
      expect(prod.imported?).to be_truthy
    end

    it 'should return false if name did not has imported text' do
      prod =Fabricate.build(:product, name: 'Chocolates')
      expect(prod.imported?).to be_falsey
    end
  end

  context '#set_category_id' do
    before(:all) do
      # Prepare hash from Seed data for testing #set_category_id.
      @categs = Category.all.select(:id, :name).inject({}) { |res, ele| res[ele.name] = ele.id; res  }
    end

    it 'should run as callback and set category id' do
      prod =Fabricate(:product, name: 'Imported Chocolates')
      expect(prod.category_id).to eq(@categs['Food'])
    end

    it 'should set category id as food category id for chocolate' do
      prod =Fabricate.build(:product, name: 'Fever Pills')
      expect(prod.category_id).to eq(nil)
      prod.set_category_id
      expect(prod.category_id).to eq(@categs['Medical'])
    end

    it 'should set category id as others category id for perfume' do
      prod =Fabricate.build(:product, name: 'Imported Perfume')
      expect(prod.category_id).to eq(nil)
      prod.set_category_id
      expect(prod.category_id).to eq(@categs['Others'])
    end
  end

  context '#get_tax' do
    it 'should get correct caculated tax for imported chocolates' do
      prod =Fabricate(:product, name: 'Imported Chocolates', price: 50.0)
      expect(prod.get_tax).to eq(2.4)
    end

    it 'should get correct caculated tax for box of chocolates' do
      prod =Fabricate(:product, name: 'Box of Chocolates', price: 30.0)
      expect(prod.get_tax).to eq(0.0)
    end

    it 'should get correct caculated tax for imported perfume' do
      prod =Fabricate(:product, name: 'Imported Perfume', price: 80.0)
      expect(prod.get_tax).to eq(10.45)
    end
  end
end
