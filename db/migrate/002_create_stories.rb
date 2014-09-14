class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.belongs_to :user

      t.string :url
      t.string :description
      t.text :extended

      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end