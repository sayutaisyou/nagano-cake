class ChangeColumnToCustomer < ActiveRecord::Migration[5.2]
  def change
    change_column_null :customers, :reset_password_sent_at, true
    change_column_null :customers, :remember_created_at, true
  end
end

