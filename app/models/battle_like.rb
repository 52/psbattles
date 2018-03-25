class BattleLike < ApplicationRecord
  belongs_to :battle, counter_cache: :points
  belongs_to :user

  validates_presence_of :user_id, :battle_id
end
