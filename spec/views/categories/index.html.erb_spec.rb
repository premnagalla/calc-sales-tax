require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        name: "Categ1",
        description: "MyText",
        tax_percentage: 2.5,
        keywords: "MyKeyword1"
      ),
      Category.create!(
        name: "Categ2",
        description: "MyText",
        tax_percentage: 2.5,
        keywords: "MyKeyword2"
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", text: "Categ1".to_s, count: 1
    assert_select "tr>td", text: "Categ2".to_s, count: 1
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyKeyword1".to_s, count: 1
    assert_select "tr>td", text: "MyKeyword2".to_s, count: 1
    assert_select "tr>td", text: 2.5.to_s, count: 2
  end
end
