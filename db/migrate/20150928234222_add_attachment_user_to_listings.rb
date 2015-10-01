class AddAttachmentUserToListings < ActiveRecord::Migration
  def self.up
    change_table :listings do |t|
      t.attachment :user
    end
  end

  def self.down
    remove_attachment :listings, :user
  end
end
