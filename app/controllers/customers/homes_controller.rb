class Customers::HomesController < ApplicationController

  def top
    @genres = Genre.all
    @items = Item.last(4)

    # オススメ商品を指定したい時
    # @discography = Discography.select('name', 'artist')
    # @discography = Discography.select(:name, :artist)
  end

  def about
  end
end
