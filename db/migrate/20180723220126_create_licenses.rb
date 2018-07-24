class CreateLicenses < ActiveRecord::Migration[5.0]
  def change
    create_table :licenses do |t|
      t.string :name
      t.float :usd_cost
      t.float :euro_cost

      t.timestamps
    end
  end
end
