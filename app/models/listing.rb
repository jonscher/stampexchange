class Listing < ActiveRecord::Base
if Rails.env.development?
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
else
   has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",

      :storage => :dropbox,
      :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
      :path => ":style/:id_:filename"
end

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :name, :price, :description, presence: true
  validates :price, numericality: {greater_than:0}

  belongs_to :user

end
