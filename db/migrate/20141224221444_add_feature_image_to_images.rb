class AddFeatureImageToImages < ActiveRecord::Migration
  def change
    add_column :images, :feature_image, :boolean
  end
end
