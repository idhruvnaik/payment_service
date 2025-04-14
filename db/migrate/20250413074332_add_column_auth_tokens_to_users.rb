class AddColumnAuthTokensToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :auth_token, :string, null: false
  end
end
