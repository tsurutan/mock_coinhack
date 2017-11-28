class AddImageToExchange < ActiveRecord::Migration[5.1]
  def change
    add_attachment :exchanges, :icon_image
  end
end
