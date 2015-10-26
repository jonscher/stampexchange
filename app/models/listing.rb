class Listing < ActiveRecord::Base
if Rails.env.development?
  has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
else
   has_attached_file :image, styles: { medium: "200x", thumb: "100x100>" }, default_url: "/images/:style/missing.png",

      :storage => :dropbox,
      :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
      :path => ":style/:id_:filename"
end

  validates_attachment_size :image, :less_than => 2.megabytes
  validates_attachment_content_type :image, styles: {medium: "200x", thumb: "100x100"}, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :name, :price, :description, :image, presence: true
  validates :price, numericality: {greater_than:0}
  belongs_to :user

end
