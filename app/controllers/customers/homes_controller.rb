class Customers::HomesController < ApplicationController

  def top
    @genres = Genre.all
    # @items = Item.order("RAND()").limit(4)
    # ↑の代わりに仮置き(データがないため)↓
    @items = Item.all
  end

  def about
  end
end


