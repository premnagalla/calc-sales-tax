class Order < ApplicationRecord
  # ##############
  # MODEL Product
  # ##############
  # id: record id (integer)
  # items: order items summary (text)
  # total_sales_tax: total sales tax amount of the order(float)
  # total_price: total price of the order(float)
  # created_at: timestamp
  # updated_at: timestamp
  # ###########

  has_many :products, dependent: :destroy

	validates :items, presence: true

	after_create :save_products_and_calculate_tax_total

	def save_products_and_calculate_tax_total
		tot_tax = 0
		tot_price = 0
		items.split("\n").each do|prod|
			prod_details = prod.split(",")
			next if prod_details[0].to_i <= 0 || prod_details.size < 3
			pr = self.products.create(quantity: prod_details[0].strip, name: prod_details[1].strip, price: prod_details[2].strip)
			tot_tax += pr.get_tax
			tot_price += pr.price
		end

		# Set rounded calculated values into Order attributes & save
		self.total_sales_tax = tot_tax
		self.total_price = (tot_price*100).round / 100.0
		self.save
	end
end
