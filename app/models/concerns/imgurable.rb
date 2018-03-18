module Imgurable
  extend ActiveSupport::Concern

  included do
    validates_presence_of :link, :user_id
    validates :link, imgur: true, if: ->(b){b.link.present?}
    validates :title,       length: {maximum: 100}
    validates :description, length: {maximum: 1000}
  end
end
