# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 Genre.create!(
  [
    {
      name: 'ケーキ',
    },
    {
      name: '焼き菓子',
    },
    {
      name: 'プリン',
    },
    {
      name: 'キャンディ',
    }
  ]
)

9.times do |n|
  Customer.create!(
    email: "test#{n + 1}@test.com",
    password: "password",
    last_name: "佐藤#{n + 1}",
    first_name: "太郎#{n + 1}",
    last_name_kana: "サトウ#{n + 1}",
    first_name_kana: "タロウ#{n + 1}",
    postal_code: "000000#{n + 1}",
    address: "東京都新宿区#{n + 1}丁目",
    telephone_number: "0000000000#{n + 1}"
  )
end

9.times do |n|
  Item.create!(
    name: "商品#{n + 1}",
    image_id: "#{n + 1}.to_i",
    introduction: "サンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキストサンプルテキスト",
    price: "#{n + 1}00.to_i",
    genre_id: 1.to_i
    )
end
