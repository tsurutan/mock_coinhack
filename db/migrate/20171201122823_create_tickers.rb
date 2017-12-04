class CreateTickers < ActiveRecord::Migration[5.1]
  def change
    create_table :tickers do |t|
      t.integer :exchange_id
      t.string :url
      t.string :volume
      t.string :bid
      t.string :ask
      t.string :market

      t.timestamps
    end
  end
end
