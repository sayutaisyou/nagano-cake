class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def up
    change_column :customers, :reset_password_token, :string, null: true
    change_column :customers, :reset_password_sent_at, :string, null: true
    change_column :customers, :remember_created_at, :string, null: true# null: trueを明示する必要がある
  end

  def down
    change_column :customers, :reset_password_token, :string, null: false
    change_column :customers, :reset_password_sent_at, :string, null: false
    change_column :customers, :remember_created_at, :string, null: false
  end
end
