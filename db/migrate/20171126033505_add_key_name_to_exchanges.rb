class AddKeyNameToExchanges < ActiveRecord::Migration[5.1]
  def change
    add_column :exchanges, :key_name, :string
  end
end
