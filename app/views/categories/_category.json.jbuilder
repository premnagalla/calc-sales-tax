json.extract! category, :id, :name, :description, :tax_percentage, :created_at, :updated_at
json.url category_url(category, format: :json)
