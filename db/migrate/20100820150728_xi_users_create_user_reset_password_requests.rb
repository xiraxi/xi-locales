class XiUsersCreateUserResetPasswordRequests < ActiveRecord::Migration
  def self.up
    create_table :user_reset_password_requests do |t|
      t.belongs_to :user
      t.string :key

      t.timestamps
    end
  end

  def self.down
    drop_table :user_reset_password_requests
  end
end


# imported migration 20100820150728 create_user_reset_password_requests from xi_users
