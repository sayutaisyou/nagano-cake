# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  
  
  Admin.create!(
    email: "aaa@aaa",
    password: "aaaaaaaa"
    )


  Genre.create!(
      name: "ケーキ"
      )
      
  Genre.create!(
      name: "プリン"
      )

  Genre.create!(
      name: "焼き菓子"
      )
      
  Genre.create!(
      name: "キャンディ"
      )

  Item.create!([{
     genre_id: 1,
     name: "りんご",
     image: File.open("./app/assets/images/no_image_square.jpg"),
     introduction: "おいしそうなりんご",
     price: "100",
     },
     {
     genre_id: 2,
     name: "レモン",
     image: File.open("./app/assets/images/no_image_square.jpg"),
     introduction: "おいしそうなレモン",
     price: "300",
     }])
     
     
   5.times do |n|
      Customer.create!(
      email: "aca@aa#{n + 1}",
      password: "aaaaaaaa",
      last_name: "tanaka",
      first_name: "sss",
      last_name_kana: "sakana",
      first_name_kana: "uo",
      postal_code: "9999999",
      address: "中",
      telephone_number: "0000000000#{n + 1}",
      is_deleted: "false"
      )
  end
   
  5.times do |n|
    Order.create!(
    customer_id: "#{n + 1}",
    postal_code: "0000000",
    address: "あああああ",
    name: "田中",
    shipping_cost: "100",
    total_payment: "222",
    created_at: "2020/12/06",
    )
  end
     
