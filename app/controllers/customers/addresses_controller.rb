class Customers::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @address = Address.new
    @address.customer_id = current_customer.id
    @addresses = current_customer.addresses.all
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def create
    @address = current_customer.addresses.new(address_params)
    @addresses = current_customer.addresses.all
    if @address.save
      redirect_to customers_addresses_path, notice: "You have created address successfully."
    else
      render :index
    end
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to customers_addresses_path, notice: "You have modified address successfully."
    else
      render :edit
    end
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to customers_addresses_path
  end
  
  
  protected
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
