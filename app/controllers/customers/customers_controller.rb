class Customers::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :hoge, if: proc { current_customer.is_deleted == true }

  def hoge
    sign_out
    redirect_to new_customer_registration_path
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
    @customer.postal_code.tr!('０-９', '0-9')
    @customer.telephone_number.tr!('０-９', '0-9')
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "編集内容を保存しました！"
      redirect_to customers_my_page_path(@customer)
    else
      render :edit
    end
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

  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
    end

end
