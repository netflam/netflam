class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.belongs_to :story
      t.belongs_to :user

      t.text :extended

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end