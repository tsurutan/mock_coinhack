class AddSlugToExchanges < ActiveRecord::Migration[5.1]
  def change
    add_column :exchanges, :slug, :string
    add_index :exchanges, :slug
  end
end
