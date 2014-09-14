class Story < ActiveRecord::Base
  belongs_to :user

  has_many :tags, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :url, length: { maximum: 500 }, url: true, :allow_blank => true
  validates :description, length: { in: 2..150 }, presence: true
end