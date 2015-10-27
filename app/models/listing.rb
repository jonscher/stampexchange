class Listing < ActiveRecord::Base
if Rails.env.development?
  has_attached_file :image1, styles: { medium: "300x300", thumb: "100x100" }, default_url: "/images/:style/missing.png"
  has_attached_file :image2, styles: { medium: "300x300", thumb: "100x100" }, default_url: "/images/:style/missing.png"
  has_attached_file :image3, styles: { medium: "300x300", thumb: "100x100" }, default_url: "/images/:style/missing.png"
  has_attached_file :certificat, styles: { medium: "300x300", thumb: "100x100" }, default_url: "/images/:style/missing.png"

else
   has_attached_file :image1, styles: { medium: "300x300", thumb: "100x100" }, default_url: "/images/:style/missing.png",
                      :storage => :dropbox,
                      :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                      :path => ":style/:id_:filename"
   has_attached_file :image2, styles: { medium: "300x300", thumb: "100x100" }, default_url: "/images/:style/missing.png",
                     :storage => :dropbox,
                     :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                     :path => ":style/:id_:filename"
   has_attached_file :image3, styles: { medium: "300x300", thumb: "100x100" }, default_url: "/images/:style/missing.png",
                     :storage => :dropbox,
                     :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                     :path => ":style/:id_:filename"
   has_attached_file :certificat, styles: { medium: "300x300", thumb: "100x100" }, default_url: "/images/:style/missing.png",
                     :storage => :dropbox,
                     :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                     :path => ":style/:id_:filename"
end

  validates_attachment_size :image1, :less_than => 2.megabytes
  validates_attachment_size :image2, :less_than => 2.megabytes
  validates_attachment_size :image3, :less_than => 2.megabytes

  validates_attachment_content_type :image1, styles: {medium: "300x300", thumb: "100x100"}, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_content_type :image2, styles: {medium: "300x300", thumb: "100x100"}, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_content_type :image3, styles: {medium: "300x300", thumb: "100x100"}, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


validates :name, :price, :description, :image1, presence: true
  validates :price, numericality: {greater_than:0}


  belongs_to :user

end
