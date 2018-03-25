class SubmissionLike < ApplicationRecord
  belongs_to :submission, counter_cache: :points
  belongs_to :user

  validates_presence_of :user_id, :submission_id
end
