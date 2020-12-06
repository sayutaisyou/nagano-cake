class Customers::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :hoge, if: proc { current_customer.is_deleted == true }

  def hoge
    sign_out
    redirect_to new_customer_registration_path
  end


  def index
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
  end
end
