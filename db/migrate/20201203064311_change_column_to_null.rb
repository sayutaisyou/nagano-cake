class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :customers, :reset_password_token, true
  end
end
