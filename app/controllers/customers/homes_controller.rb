class Customers::HomesController < ApplicationController

  def top
    @genres = Genre.all
    @items = Item.order("RAND()").limit(4)
  end

  def about
  end
end
