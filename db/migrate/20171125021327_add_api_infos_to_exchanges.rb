class AddApiInfosToExchanges < ActiveRecord::Migration[5.1]
  def change
    add_column :exchanges, :ticker_url, :string
    add_column :exchanges, :volume_key, :string
    add_column :exchanges, :bid_key, :string
    add_column :exchanges, :ask_key, :string
  end
end
