class Customers::AddressesController < ApplicationController
  before_action :authenticate_customer!
  before_action :hoge, if: proc { current_customer.is_deleted == true }

  def hoge
    sign_out
    redirect_to new_customer_registration_path
  end

  def index
    @address = Address.new
    @addresses = Address.all
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
