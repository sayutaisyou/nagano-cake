class Admins::ItemsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @items = Item.all.page(params[:page]).per(5)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_item_path(@item), notice: "商品が新しく登録されました。"
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
    item_including_tax = @item.price * 1.1
    @item_including_tax = item_including_tax.floor
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_item_path(@item)
    else
      render 'edit'
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end
  
  
end
