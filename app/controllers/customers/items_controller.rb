class Customers::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all
    @items_paginate = Item.page(params[:page]).reverse_order
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
  end
end
