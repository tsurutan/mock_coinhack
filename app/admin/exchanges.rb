ActiveAdmin.register Exchange do
  permit_params :name, :icon, :overview, :description, :exchange_type, :credit_transaction, :futures_transaction, :created_at, :ticker_url, :volume_key, :bid_key, :ask_key, :icon_image, :slug


  form do |f|
    f.inputs "アイテム画像" do
      f.input :name
      f.input :icon_image, :as => :file, :hint => f.object.new_record? ? "" : f.template.image_tag(f.object.icon_image.url(:thumb))
      f.input :overview
      f.input :description
      f.input :exchange_type
      f.input :credit_transaction
      f.input :futures_transaction
      f.input :ticker_url
      f.input :volume_key
      f.input :bid_key
      f.input :ask_key
      f.input :slug
    end
    f.actions
  end

  show do |item_image|
    attributes_table do
      row :name
      row :icon_image do
        image_tag(item_image.icon_image.url(:medium))
      end
      row :overview
      row :description
      row :exchange_type
      row :credit_transaction
      row :futures_transaction
      row :ticker_url
      row :volume_key
      row :bid_key
      row :ask_key
      row :slug
    end
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
end
