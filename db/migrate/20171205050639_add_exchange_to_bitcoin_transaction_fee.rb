class AddExchangeToBitcoinTransactionFee < ActiveRecord::Migration[5.1]
  def change
    add_column :exchanges, :bitcoin_transaction_fee, :float
  end
end
