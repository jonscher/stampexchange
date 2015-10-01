class AddAttachmentImageToListings < ActiveRecord::Migration
  def self.up
    def up
      add_attachment :listings, :image
    end
  end

  def self.down
    remove_attachment :listings, :image
  end
end
