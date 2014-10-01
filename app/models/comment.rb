class Comment < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  validates :extended, length: { minimum: 2 }, presence: true

  def self.recent
    order("created_at DESC")
  end

  def self.popular # DON'T WORK

  end
end