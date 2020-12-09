class Customers::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    # 以下ジャンル検索実装の記述箇所
    i = @genres.count #範囲オブジェクトの上限値として使うためにジャンルの個数をiと定義
    n = params[:order_sort].to_i # order_sortで受け取ったパラメータの値を整数型で取得しnと定義する
    case n
    when 1..i #order_sortが1~iの時
      @genre_name = Genre.find(n).name #ジャンルのn番目の主キーのnameカラムを取り出している
      @item_count = Item.where(genre_id: n) #genre_id: 1のカラムを持つ商品全てを配列で取得
      @items_paginate = @item_count.page(params[:page]).per(8) #whereで取り出したデータにページネーションを適用
    else #order_sortがnilの時
      @genre_name = "商品"
      @item_count = Item.all
      @items_paginate = Item.page(params[:page]).per(8)
    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
