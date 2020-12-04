class Customers::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    # 商品idの受け渡し
    @address = Address.find(params[:id])
    @address.customer_id = current_customer.id
    
    postal_codes1 = current_customer.addresse.postal_code.all
    addresss1     = current_customer.addresse.address.all
    names1        = current_customer.addresse.name.all
  end
  
  def confirm
    @order = current_customer.orders.new(order_params)
    if radio_button = "0"
      postal_code = current_customer.customers.postal_code
      address     = current_customer.customers.address
      name        = current_customer.customers.name
    elsif radio_button = "1"
      postal_code = current_customer.addresses.postal_code.find(params[:id])
      address     = current_customer.addresses.address.find(params[:id])
      name        = current_customer.addresses.name.find(params[:id])
    else
      postal_code = current_customer.addresses.postal_code.new(order_params)
      address     = current_customer.addresses.address.new(order_params)
      name        = current_customer.addresses.name.new(order_params)
    end
  end

  def complete
  end
  
  def create
    
  end

  def index
  end

  def show
  end
  
  protected
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
