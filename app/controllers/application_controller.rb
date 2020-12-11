class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    # 下記の意味：遷移元で与えたパラメータを使って条件分岐
    if params[:order_sort] == "0"
      # 下記の意味：マイページから遷移してきたときはログアウトさせてからパスワード再設定ページに飛ばす
      sign_out
      new_customer_password_path
    elsif current_admin
      admins_homes_top_path
    elsif current_customer.is_deleted == true
      sign_out
      root_path
    elsif customer_signed_in?
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
    end
end
