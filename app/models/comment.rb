# COMMENT MODEL                                                             ---
#
# Version:                               models/comment.rb    0.0.1    04/10/14
# Authors:              Maciej A. Czyzewski, <maciejanthonyczyzewski@gmail.com>

class Comment < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  validates :extended, length: { minimum: 2 }, presence: true

  after_save :comments_save

  def self.recent
    order("created_at DESC")
  end

  def self.popular
    # DON'T WORK
  end

  private
    def comments_save
      Netflam::Notification.save(user_id, story_id, 'C')
    end
end