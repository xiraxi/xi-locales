class XiUsersAddPhotoToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :photo_file_name, :string
    add_column :users, :photo_content_type, :string
    add_column :users, :photo_file_size, :integer
    add_column :users, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :users, :photo_updated_at
    remove_column :users, :photo_file_size
    remove_column :users, :photo_content_type
    remove_column :users, :photo_file_name
  end
end


# imported migration 20100822102454 add_photo_to_user from xi_users
