require 'rails_helper'

RSpec.describe Category, type: :model do
  context "Associations" do
    it "should have many products" do
      c = Category.reflect_on_association(:products)
      expect(c.macro).to eq(:has_many)
    end
  end

  context "when validating an category" do
    %w(name tax_percentage).each do |attr|
      it "must have an attribute '#{attr}'" do
        u = Fabricate.build(:category)
        u.send("#{attr}=",nil)
        expect(u.valid?).to be_falsey
      end
    end

    it 'name should be unique' do
      categ1 = Fabricate(:category, name: 'Categ1')
      categ1 = Fabricate.build(:category, name: 'Categ1')
      expect(categ1.valid?).to be_falsey
    end
  end
end
