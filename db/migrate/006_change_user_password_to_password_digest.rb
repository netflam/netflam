class ChangeUserPasswordToPasswordDigest < ActiveRecord::Migration
  class User < ActiveRecord::Base
    has_secure_password validations: false    
  end

  def up
    rename_column :users, :password, :password_digest

    User.reset_column_information

    User.find_each do |user|
      user.password = user.password_digest
      user.save
    end
  end

  def down
    fail 'Irreversible migration, passwords are definitively lost'
  end
end
