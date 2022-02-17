require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      items: "1, book, 15.0\n1, music CD, 10.0\n1, chocolate bar, 5.0"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "textarea[name=?]", "order[items]"

    end
  end
end
