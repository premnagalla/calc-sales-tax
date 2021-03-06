require 'rails_helper'

RSpec.describe "categories/new", type: :view do
  before(:each) do
    assign(:category, Category.new(
      name: "MyString",
      description: "MyText",
      tax_percentage: 1.5,
      keywords: "MyKeyword"
    ))
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", categories_path, "post" do

      assert_select "input[name=?]", "category[name]"

      assert_select "textarea[name=?]", "category[description]"

      assert_select "input[name=?]", "category[tax_percentage]"

      assert_select "textarea[name=?]", "category[keywords]"
    end
  end
end
