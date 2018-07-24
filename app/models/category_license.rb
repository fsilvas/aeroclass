class CategoryLicense < ApplicationRecord
	belongs_to :category
	belongs_to :license
end
