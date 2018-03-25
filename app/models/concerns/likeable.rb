module Likeable
  extend ActiveSupport::Concern

  included do
    scope :newest, ->{order created_at: :desc}
    scope :top,    ->{order points:     :desc}

    # liked by given user
    def liked_by user
      likes.create user_id: user.id
    end

    # check if liked by given user
    def liked_by? user
      likes.where(user_id: user.id).any?
    end

    # unliked by given user
    def unliked_by user
      liked = likes.find_by user_id: user.id
      liked&.destroy
    end
  end
end
