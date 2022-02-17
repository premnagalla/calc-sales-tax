class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.text :items
      t.float :total_sales_tax
      t.float :total_price

      t.timestamps
    end
  end
end
