class Customers::CustomersController < ApplicationController
  def show
  end

  def edit
    @customer = Customer.find(params[:id])
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
  end

  def withdraw
  end

  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
    end

end
