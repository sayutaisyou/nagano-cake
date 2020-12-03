class Customers::AddressesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @address = Address.new
    @address.customer_id = current_user.id
    @addresses = current_user.Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def create
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
    @address.destroy
    redirect_to customers_addresses_path
  end
  
  
  protected
  def address_params
    params.require(:address).permit(:posta_code, :address, :name)
  end
end
