require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      items: "1, book, 15.0\n1, music CD, 10.0\n1, chocolate bar, 5.0"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1, book, 15.0/)
    expect(rendered).to match(/0.9/)
    expect(rendered).to match(/30.0/)
  end
end
