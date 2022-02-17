require 'rails_helper'

RSpec.describe "categories/edit", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      name: "MyString",
      description: "MyText",
      tax_percentage: 1.5
    ))
  end

  it "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(@category), "post" do

      assert_select "input[name=?]", "category[name]"

      assert_select "textarea[name=?]", "category[description]"

      assert_select "input[name=?]", "category[tax_percentage]"
    end
  end
end
