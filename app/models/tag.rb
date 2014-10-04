# TAG MODEL                                                                 ---
#
# Version:                                   models/tag.rb    0.0.1    04/10/14
# Authors:              Maciej A. Czyzewski, <maciejanthonyczyzewski@gmail.com>

class Tag < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  validates :name, length: { maximum: 100 }
end