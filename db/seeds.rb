# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Customer.create!(
#   last_name: '山田',
#   first_name: '孝之',
#   last_name_kana: 'ヤマダ',
#   first_name_kana: 'タカユキ',
#   email: 'takayuki@takayuki',
#   password: 'yamadataro',
#   postal_code: '0000000',
#   address: '東京都新宿区',
#   telephone_number: '09000000000',
#   is_deleted: 'false'
#   )
#   Admin.create!(
#   email: 'test1@test',
#   password: 'testtest'
#   )
  Genre.create!(
    [
      {
        name: 'ケーキ',
      },
      {
        name: 'クッキー'
      },
      {
        name: 'チョコレート'
      },
      {
        name: 'プリン'
      }
      ]
    )
  Item.create!(
    [
      {
        genre_id: '1',
        name: '洋梨チーズタルト',
        image: File.open('./app/assets/images/test.jpg'),
        introduction: 'おいしいよ',
        price: '1091',
        is_active: 'true'
      },
      {
        genre_id: '2',
        name: 'なめらかプリン',
        image: File.open('./app/assets/images/test.jpg'),
        introduction: 'おいしいよ',
        price: '227',
        is_active: 'true'
      },
      {
        genre_id: '1',
        name: '特製ガトーショコラ',
        image: File.open('./app/assets/images/test.jpg'),
        introduction: 'おいしいよ',
        price: '2545',
        is_active: 'true'
      },
      {
        genre_id: '3',
        name: 'マカロンセット',
        image: File.open('./app/assets/images/test.jpg'),
        introduction: 'おいしいよ',
        price: '1583',
        is_active: 'true'
      },

    ]
  )
  Order.create!(
    customer_id: '1',
    postal_code: '0300000',
    address: '東京都新宿区',
    name: '山田次郎',
    shipping_cost: '800',
    total_payment: '7150',
  )
  OrderDetail.create!(
    [
      {
        order_id: '1',
        item_id: '1',
        price: '1200',
        amount: '1',
      },
      {
        order_id: '1',
        item_id: '2',
        price: '250',
        amount: '5',
      },
      {
        order_id: '1',
        item_id: '3',
        price: '2800',
        amount: '1',
      },
      {
        order_id: '1',
        item_id: '4',
        price: '1900',
        amount: '1',
      },
    ]
  )