class Category < ApplicationRecord
	has_many :category_licenses, inverse_of: :category, dependent: :destroy
	has_many :licenses, through: :category_licenses
end
