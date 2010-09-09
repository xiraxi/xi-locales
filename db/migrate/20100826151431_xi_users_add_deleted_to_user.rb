class XiUsersAddDeletedToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :deleted_at, :datetime
  end

  def self.down
    remove_column :users, :deleted_at
  end
end


# imported migration 20100826151431 add_deleted_to_user from xi_users
