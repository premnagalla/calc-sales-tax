Fabricator(:order) do
  items "1, book, 15.0\n1, music CD, 10.0\n1, chocolate bar, 5"
  total_sales_tax 0.9
  total_price 30.0
end
