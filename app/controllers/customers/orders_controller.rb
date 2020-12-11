class Customers::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :hoge, if: proc { current_customer.is_deleted == true }

  def hoge
    sign_out
    redirect_to new_customer_registration_path
  end

  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    # Orderの受け皿を作る
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    # CartItemからカート商品を取得
    @cart_items = current_customer.cart_items
    # ciの税込価格を計算、ciの合計金額を計算
    @sum = 0
    @cart_items.each do |ci|
      ci_tax_price = (ci.item.price * 1.1 * ci.amount).floor
      @sum += ci_tax_price
    end
    # orderの請求金額を計算
    @order.total_payment = @sum + @order.shipping_cost
    # orderのユーザー入力部分登録（@order.paymentはストロングパラメータorder_paramsで受け取り済）
    unless (@order.payment_method == 'クレジットカード') || (@order.payment_method == '銀行振込' )
      render :new
      return
    end
    # 選択した配送先の値を設定
    to_address = params[:to_address]
    if to_address == "0"
      @order.postal_code = current_customer.postal_code
      @order.address     = current_customer.address
      @order.name        = current_customer.full_name
      render :confirm
    elsif to_address == "1"
      @address = Address.find(params[:name][:id])
      @order.postal_code = @address.postal_code
      @order.address     = @address.address
      @order.name        = @address.name
      render :confirm
    elsif to_address == "2"
      # 新規の配送先を登録する
      @address = current_customer.addresses.new(address_params)
      @address.postal_code.tr!('０-９', '0-9')
      @address.save
      # 作成した新規配送先を基に、@orderのカラムを埋める
      @order.postal_code = @address.postal_code
      @order.address     = @address.address
      @order.name        = @address.name
      render :confirm
    else
      render :new
    end
    # POSTメソッドなのでrenderしてビューを取得する必要がある
    # fields_for 複数データを一度に保存する時に使用可能
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    # CartItemからカート商品を取得
    cart_items = current_customer.cart_items
    if @order.save
      # カート商品から注文商品を作成、orderの合計金額を計算
      sum = 0
      cart_items.each do |ci|
        order_detail = OrderDetail.new(order_id: @order.id)
        order_detail.item_id = ci.item_id
        order_detail.price = (ci.item.price * 1.1).floor
        order_detail.amount = ci.amount
        order_detail.save
        # ここでカートitemを順次削除してもよい
        sum += order_detail.price
      end
      current_customer.cart_items.destroy_all
      redirect_to customers_orders_complete_path
    else
      render :confirm
    end
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  protected
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
  end

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount)
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name)
  end

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
