class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    # 下記の意味：遷移元で与えたパラメータを使って条件分岐
    case params[:order_sort]
      # 下記の意味：マイページから遷移してきたときはログアウトさせてからパスワード再設定ページに飛ばす
      when "0"
        sign_out
        new_customer_password_path
      else
        root_path
    end
  end

    def after_sign_out_path_for(resource)
      root_path
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
    end
end
