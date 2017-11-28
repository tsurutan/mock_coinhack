ActiveAdmin.register CryptoCurrency do
  permit_params :name, :overview, :icon_image


  form do |f|
    f.inputs "アイテム画像" do
      f.input :name
      f.input :overview
      f.input :icon_image, :as => :file, :hint => f.object.new_record? ? "" : f.template.image_tag(f.object.icon_image.url(:thumb))
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
    end
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

end
