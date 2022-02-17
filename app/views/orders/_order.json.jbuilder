json.extract! order, :id, :items, :total_sales_tax, :total_price, :created_at, :updated_at
json.url order_url(order, format: :json)
