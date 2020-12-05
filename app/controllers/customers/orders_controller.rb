class Customers::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    # CartItemからカート商品を取得
    cart_items = current_customer.cart_items.all
    # カート商品から注文商品を作成、orderの合計金額を計算
    sum = 0
   
      cart_items.each do |c|
        order_detail = OrderDetail.new(order_id: @order.id)
        order_detail.item_id = c.item_id
        order_detail.price = c.item.price * 1.1
        order_detail.amount = c.amount
        sum += order_detail.price
      end
  
    @order.total_payment = sum
    @addresses = current_customer.addresses.all
  end
    
  def confirm
    # orderのユーザー入力部分登録（@order.paymentはparamsで受け取る）
    @order = Order(params[:id])
    if radio_button = "0"
      @order.postal_code = current_customer.customers.postal_code
      @order.address     = current_customer.customers.address
      @order.name        = current_customer.customers.name
    elsif radio_button = "1"
      @order.postal_code = current_customer.addresses.postal_code.find(params[:id])
      @order.address     = current_customer.addresses.address.find(params[:id])
      @order.name        = current_customer.addresses.name.find(params[:id])
    else
      @order.postal_code = current_customer.addresses.postal_code.new(order_params)
      @order.address     = current_customer.addresses.address.new(order_params)
      @order.name        = current_customer.addresses.name.new(order_params)
    end
  end

  def complete
  end
  
  def create
    @order = Order(params[:id])
    if @order.save
      current_user.cart_items.destroy_all
      redirect_to customers_orders_complete_path
    else
      render :confirm
    end
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order(params[:id])
    @order_details = @order.order_details
  end
  
  protected
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
  
  def order_detail_params
    params.require(:order_detail).permit(:payment_method, :postal_code, :address, :name)
  end
end
