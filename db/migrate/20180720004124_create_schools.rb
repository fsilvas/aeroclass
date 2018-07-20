class CreateSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :schools do |t|
      t.text :name
      t.text :address
      t.string :rbd
      t.string :principal
      t.string :principal_email
      t.string :principal_phone
      t.string :utp
      t.string :utp_email
      t.string :utp_phone
      t.string :tic
      t.string :tic_email
      t.string :tic_phone
      t.string :isp
      t.string :bandwidth
      t.integer :n_teachers_pre
      t.integer :n_teachers_pri
      t.integer :n_teachers_sec

      t.timestamps
    end
  end
end
