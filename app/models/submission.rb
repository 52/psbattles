class Submission < ApplicationRecord
  include Imgurable
  include Likeable

  belongs_to :user
  belongs_to :battle
  has_many :likes, class_name: :SubmissionLike

  validates_presence_of :battle_id
end
