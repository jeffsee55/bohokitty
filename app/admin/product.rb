ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :description, :price, :options, images_attributes: [:image, :id, :feature_image, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    column :name
    column :price
    actions
  end

  form html: { multipart: true } do |f|
    f.inputs "Product" do
      f.input :name
      f.input :description
      f.input :price, hint: "In pennies. $300 should be listed as 30000"
      f.input :options
      f.inputs do
      f.has_many :images, allow_destroy: true do |i|
        i.input :image, hint: f.template.image_tag(i.object.url(:thumb))
        i.input :feature_image
      end
      end
    end
    f.actions
  end



end
