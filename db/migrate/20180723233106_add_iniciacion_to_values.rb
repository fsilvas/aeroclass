class AddIniciacionToValues < ActiveRecord::Migration[5.0]
  def change
    add_column :values, :iniciacion, :float
    add_column :values, :avanzado, :float
    add_column :values, :logro, :float
  end
end
