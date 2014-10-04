# USER MODEL                                                                ---
#
# Version:                                  models/user.rb    0.0.1    04/10/14
# Authors:              Maciej A. Czyzewski, <maciejanthonyczyzewski@gmail.com>

class User < ActiveRecord::Base
  has_many :stories, dependent: :destroy

  has_many :tags, through: :stories
  has_many :votes, through: :stories
  has_many :comments, through: :stories

  has_secure_password validations: true

  validates :email, length: { minimum: 2 }, email: true, uniqueness: true
  validates :username, length: { minimum: 2 }, uniqueness: true
  validates :password, length: { in: 6..20 }, presence: true, :on => :create
  validates :realname, length: { minimum: 2 }, presence: true
  validates :bio, length: { maximum: 500 }, presence: false
end
