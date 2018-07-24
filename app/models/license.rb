class License < ApplicationRecord
	has_many :category_licenses, inverse_of: :license, dependent: :destroy
	has_many :categories, through: :category_licenses
end
