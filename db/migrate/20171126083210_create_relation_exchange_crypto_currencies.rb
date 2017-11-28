class CreateRelationExchangeCryptoCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :relation_exchange_crypto_currencies do |t|
      t.references :exchange, foreign_key: true
      t.references :crypto_currency, foreign_key: true

      t.timestamps
    end
  end
end
