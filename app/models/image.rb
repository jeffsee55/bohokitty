class Image < ActiveRecord::Base
  belongs_to :product

  has_attached_file :image,
    :storage => :s3,
    styles: { medium: "500x500", thumb: "100x100"},
    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    
  def s3_credentials
    {:bucket => "bohokitty-assets", :access_key_id => "AKIAI3BOBWFCEXP7K6OQ", :secret_access_key => "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"}
  end

  def url(size)
    image.url(size.to_sym)
  end
end
