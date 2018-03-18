class Battle < ApplicationRecord
  include Imgurable
  extend FriendlyId

  belongs_to :user
  has_many :submissions

  validates_presence_of :title

  friendly_id :title, use: :slugged
end
