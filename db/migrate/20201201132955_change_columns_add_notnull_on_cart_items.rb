class ChangeColumnsAddNotnullOnCartItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cart_items, :amount, false
  end
end
