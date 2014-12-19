ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :body, :page
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    column :title
    column "body" do |desc|
      desc.body.slice(0, 100)
    end
    column :page
    actions
  end

  form do |f|
    f.inputs "Content" do
      f.input :title
      f.input :body
    end
    f.inputs "Page" do
      f.input :page, as: :select, collection: ["Home", "About", "Contact", "Real Brides", "Inspiration"]
    end
    f.actions
  end
end
