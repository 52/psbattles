class Battle < ApplicationRecord
  include Imgurable
  include Likeable
  extend FriendlyId

  belongs_to :user
  has_many :submissions
  has_many :likes, class_name: :BattleLike

  validates_presence_of :title

  friendly_id :title, use: :slugged
end
