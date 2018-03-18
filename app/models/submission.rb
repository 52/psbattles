class Submission < ApplicationRecord
  include Imgurable

  belongs_to :user
  belongs_to :battle

  validates_presence_of :battle_id
end
