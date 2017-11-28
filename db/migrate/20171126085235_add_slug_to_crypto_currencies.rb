class AddSlugToCryptoCurrencies < ActiveRecord::Migration[5.1]
  def change
    add_column :crypto_currencies, :slug, :string
    add_index :crypto_currencies, :slug
  end
end
