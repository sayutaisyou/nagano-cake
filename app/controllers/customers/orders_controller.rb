class Customers::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :hoge, if: proc { current_customer.is_deleted == true }

  def hoge
    sign_out
    redirect_to new_customer_registration_path
  end

  def new
  end

  def confirm
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
