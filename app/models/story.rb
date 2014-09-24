class Story < ActiveRecord::Base
  belongs_to :user

  has_many :tags, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :url, length: { maximum: 500 }, url: true, :allow_blank => true
  validates :description, length: { in: 2..150 }, presence: true

  def self.recent
    order("created_at DESC")
  end

  def self.popular # DON'T WORK
    find(Meter.top(0, 100)).sort_by! {|u| Meter.top(0, 100).index u[:id]}
  end
end