class Customers::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :hoge, if: proc { current_customer.is_deleted == true }

  def hoge
    sign_out
    redirect_to new_customer_registration_path
  end

  def index
    @cart_items = current_customer.cart_items
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to customers_cart_items_path, notice: "個数が変更されました"
    else
      @cart_items = current_customer.cart_items
      render :index
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to customers_cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    if @cart_items.count == 0
      render :index
    else
      @cart_items.destroy_all
      redirect_to customers_items_path
    end
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_items = current_customer.cart_items
    if @cart_item.save
      redirect_to customers_cart_items_path
    else
      render :index
    end
  end

  protected
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
