class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.integer :client_id
      t.string :begin_address
      t.string :begin_comuna
      t.string :end_address
      t.string :end_comuna
      t.datetime :hour
      t.datetime :service_date
      t.string :driver
      t.integer :n_passenger
      t.integer :n_bag
      t.string :flight
      t.string :pay_type
      t.string :status
      t.text :comment
      t.integer :price

      t.timestamps
    end
  end
end
