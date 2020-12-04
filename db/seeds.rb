# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.create!(
  last_name: '山田', 
  first_name: '太郎', 
  last_name_kana: 'ヤマダ', 
  first_name_kana: 'タロウ', 
  email: 'abc@defg', 
  encrypted_password: 'masanoridesu', 
  postal_code: '0000000', 
  address: '東京都新宿区', 
  telephone_number: '09000000000', 
  is_deleted: 'false'
  )