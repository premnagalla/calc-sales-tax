require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        items: "1, book, 15.0\n1, music CD, 10.0\n1, chocolate bar, 5.0"
      ),
      Order.create!(
        items: "1, book, 15.0\n1, music CD, 10.0\n1, chocolate bar, 5.0"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", text: "1, book, 15.0, 1, music CD, 10.0, 1, chocolate bar, 5.0".to_s, count: 2
    assert_select "tr>td", text: 0.9.to_s, count: 2
    assert_select "tr>td", text: 30.0.to_s, count: 2
  end
end
