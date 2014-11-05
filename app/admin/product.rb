ActiveAdmin.register Product do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :description, :price
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form do |f|
    f.inputs "New Product" do
      f.input :name
      f.input :description, hint: "Limit to 120 characters"
      f.input :price, hint: "In pennies. $300 should be listed as 30000"
    end
    f.actions
  end



end
