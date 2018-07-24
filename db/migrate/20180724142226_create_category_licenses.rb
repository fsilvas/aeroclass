class CreateCategoryLicenses < ActiveRecord::Migration[5.0]
  def change
    create_table :category_licenses do |t|
      t.integer :category_id
      t.integer :license_id

      t.timestamps
    end
  end
end
