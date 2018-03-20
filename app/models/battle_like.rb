class BattleLike < ApplicationRecord
  belongs_to :battle
  belongs_to :user

  validates_presence_of :user_id, :battle_id
end
