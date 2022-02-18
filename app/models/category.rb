class Category < ApplicationRecord
  # ###############
  # MODEL Caetgory
  # ###############
  # id: record id (integer)
  # name: category name (varchar)
  # description: description of category (text)
  # tax_percentage: tax percentage for that category (float)
  # created_at: timestamp
  # updated_at: timestamp
  # ###########

  has_many :products

	validates :name, presence: true, uniqueness: true
	validates :tax_percentage, presence: true
  validates :keywords, presence: true
end
