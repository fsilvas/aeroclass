class CreateQuotations < ActiveRecord::Migration[5.0]
  def change
    create_table :quotations do |t|
      t.string :status
      t.datetime :quotation_date
      t.float :price

      t.timestamps
    end
  end
end
