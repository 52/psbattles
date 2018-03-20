class SubmissionLike < ApplicationRecord
  belongs_to :submission
  belongs_to :user

  validates_presence_of :user_id, :submission_id
end
