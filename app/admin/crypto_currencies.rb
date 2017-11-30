ActiveAdmin.register CryptoCurrency do
  permit_params :name, :overview, :icon_image, :description, :symbol, :purchasable_currency, :white_paper, :blog, :fund_raised_amount, :initial_price, :platform, :token_upper_limit, :token_sale_supply_amount, :key_name


  form do |f|
    f.inputs "アイテム画像" do
      f.input :name
      f.input :overview
      f.input :icon_image, :as => :file, :hint => f.object.new_record? ? "" : f.template.image_tag(f.object.icon_image.url(:thumb))
      f.input :description
      f.input :symbol
      f.input :purchasable_currency
      f.input :white_paper
      f.input :blog
      f.input :fund_raised_amount
      f.input :initial_price
      f.input :platform
      f.input :token_upper_limit
      f.input :token_sale_supply_amount
      f.input :key_name
    end
    f.actions
  end

  show do |item_image|
    attributes_table do
      row :name
      row :overview
      row :icon_image do
        image_tag(item_image.icon_image.url(:medium))
      end
      row :description
      row :symbol
      row :purchasable_currency
      row :white_paper
      row :blog
      row :fund_raised_amount
      row :initial_price
      row :platform
      row :token_upper_limit
      row :token_sale_supply_amount
      row :key_name
    end
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

end
