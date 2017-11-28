class CreateCryptoCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :crypto_currencies do |t|
      t.string :name
      t.text :overview
      t.text :description
      t.string :symbol
      t.string :purchasable_currency
      t.date :released_at
      t.string :white_paper
      t.string :blog
      t.string :fund_raised_amount
      t.string :initial_price
      t.string :platform
      t.string :token_upper_limit
      t.string :token_sale_supply_amount
      t.string :key_name

      t.timestamps
    end
  end
end
