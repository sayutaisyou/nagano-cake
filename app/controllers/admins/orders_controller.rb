class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    case params[:order_sort]
    when "0" # トップページから遷移
      @orders = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).page(params[:page]).per(10)
      #binding.pry
    when "1"
      @customer = Customer.find(params[:id])
      @orders = @customer.orders.page(params[:page]).per(10) # 会員詳細から遷移
    else
      @orders = Order.page(params[:page]).per(10)# ヘッダーから遷移
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    if order_params[:status] == '入金確認'
      @order_details = order.order_details
      @order_details.each do |order_detail|
        order_detail.update(making_status: '製作待ち')
      end
    end
    redirect_to admins_order_path(order.id)
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
