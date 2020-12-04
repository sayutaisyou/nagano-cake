class Customers::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    # boolean型カラムis_deletedのステータスをfaulseからtrueに変更
    @customer.is_deleted = true
    # ユーザーのサインアウト(sign_out関数)
    sign_out
    redirect_to root_path
  end
end
