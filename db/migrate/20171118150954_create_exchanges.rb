class CreateExchanges < ActiveRecord::Migration[5.1]
  def change
    create_table :exchanges do |t|
      t.string :name
      t.string :icon
      t.string :overview
      t.text :description
      t.string :exchange_type
      t.string :credit_transaction
      t.string :futures_transaction

      t.timestamps
    end
  end
end
