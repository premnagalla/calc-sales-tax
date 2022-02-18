class Product < ApplicationRecord
  # ##############
  # MODEL Product
  # ##############
  # id: record id (integer)
  # name: product name (varchar)
  # category_id: foreign key into Categories (integer)
  # order_id: foreign key into Orders (integer)
  # quantity: quantity details (integer)
  # price: price of product (float)
  # created_at: timestamp
  # updated_at: timestamp
  # ###########

  belongs_to :category, optional: true
  belongs_to :order

  validates :name, presence: true
  validates :order_id, presence: true

  before_save :set_category_id

  def set_category_id
    category_id_keywords = Category.all.inject({}) do |res, categ|
      res[categ.id] = categ.keywords.split(',').collect(&:strip)
      res
    end
    category_id = (category_id_keywords.detect { |id, keywords| keywords.any? { |word| name.downcase.include?(word) } } || [])[0]
    category_id ||= Category.where(name: 'Others').first.id
    self.category_id = category_id
  end

  def imported?
    name.downcase.include?('imported')
  end

  def get_tax
    pr_tax_percent = category.tax_percentage
    pr_tax_percent += imported? ? 5 : 0
    price_before_tax = price/(1+(pr_tax_percent/100))
    prod_tax = ((price - price_before_tax)*20).round / 20.0
  end
end
