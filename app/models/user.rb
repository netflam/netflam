class User < ActiveRecord::Base
  has_many :stories, dependent: :destroy

  has_many :tags, through: :stories
  has_many :votes, through: :stories
  has_many :comments, through: :stories

  validates :email, length: { minimum: 2 }, email: true, uniqueness: true
  validates :username, length: { minimum: 2 }, uniqueness: true
  validates :password, length: { in: 6..20 }
  validates :realname, length: { minimum: 2 }
  validates :bio, length: { maximum: 500 }, presence: false

  has_secure_password
end
