class Image < ActiveRecord::Base
  belongs_to :product
  has_attached_file :image, styles: { medium: "500x500", thumb: "100x100"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


  def url(size)
    image.url(size.to_sym)
  end
end
