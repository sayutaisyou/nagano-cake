# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create!(
   name: 'ケーキ'
)

5.times do |n|
    Item.create!(
      genre_id: 1,
      name: "ケーキ#{n + 1}",
      image_id: File.open('./app/assets/images/661.png'),
      introduction: "説明文その#{n + 1}",
      price: 2000 + n
    )
end

5.times do |n|
    Customer.create!(
      email: "test@test#{n + 1}",
      password: 'testtest',
      last_name: '菅',
      first_name: "義偉#{n + 1}",
      last_name_kana: 'スガ',
      first_name_kana: 'ヨシヒデ',
      postal_code: '0009999',
      address: '東京都中央区',
      telephone_number: '0001112222'
    )
end

CartItem.create!(
   item_id: 1,
   customer_id: 1,
   amount: 1
)
CartItem.create!(
   item_id: 2,
   customer_id: 2,
   amount: 2
)
CartItem.create!(
   item_id: 3,
   customer_id: 3,
   amount: 3
)

# fruits = ["apple", "orange", "melon", "banana", "pineapple"]
 
# p fruits.sample(2)
# p fruits.sample(4)
# p fruits.sample(8)