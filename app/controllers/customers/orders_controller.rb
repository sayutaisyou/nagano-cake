class Customers::OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @order = Order.new
    @order.customer_id = current_user.id
    @address = Address.find(params[:id])
    @address.customer_id = current_user.id
  end
  
  def confirm
    if radio_button = "0"
      address = current_user.customers.address
    elsif radio_button = "1"
      address = current_user.customers.address.all
    else
      address = current_user.addresses.address(params[:id])
    end
    address = Address.find(params[:id])
  end

  def complete
  end
  
  def create
    
  end

  def index
  end

  def show
  end
end
