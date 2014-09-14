class Tag < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  validates :name, length: { maximum: 100 }
end