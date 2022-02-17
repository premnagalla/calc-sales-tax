Fabricator(:product) do
  name { sequence(:product_name) { |n| "Product#{n}" }}
  category
  order
  quantity 1
  price 30.0
end
