class CreateValues < ActiveRecord::Migration[5.0]
  def change
    create_table :values do |t|
      t.float :dolar
      t.float :euro
      t.float :tablet_cost
      t.float :book_cost

      t.timestamps
    end
  end
end
