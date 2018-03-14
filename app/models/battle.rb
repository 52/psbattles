class Battle < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :link, :user_id
  validates :title,       length: {maximum: 100}
  validates :description, length: {maximum: 1000}
  validates :link, imgur: true, if: ->(b){b.link.present?}
end
