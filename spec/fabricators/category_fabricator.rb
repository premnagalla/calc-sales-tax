Fabricator(:category) do
  name { sequence(:category_name) { |n| "Category#{n}" }}
  description { sequence(:category_description) { |n| "Category Description #{n}" }}
  tax_percentage 10.0
end
