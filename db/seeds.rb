# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new
user.email = 'admin@santillana.cl'
user.name = 'Admin'
user.last_name = ' '
user.password = '1234567890'
user.password_confirmation = '1234567890'
user.add_role :admin
user.save

value = Value.create(dolar: 0, euro: 0, tablet_cost: 0, book_cost: 0)