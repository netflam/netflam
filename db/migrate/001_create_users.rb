class CreateUsers < ActiveRecord::Migration
  class User < ActiveRecord::Base
    has_secure_password validations: false
  end

  def self.up
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password
      t.string :realname
      t.text   :bio

      t.timestamps
    end

    rename_column :users, :password, :password_digest
  end

  def self.down
    drop_table :users
  end
end