class AddImageToCryptoCurrencies < ActiveRecord::Migration[5.1]
  def change
    add_attachment :crypto_currencies, :icon_image
  end
end
