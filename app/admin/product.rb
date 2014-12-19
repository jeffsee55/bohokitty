ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :description, :price, images_attributes: [:image, :id]
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
    f.inputs "New Product" do
      f.input :name
      f.input :description
      f.input :price, hint: "In pennies. $300 should be listed as 30000"
      f.inputs do
        f.has_many :images do |i|
          i.input :image
        end
      end
    end
    f.actions
  end



end
