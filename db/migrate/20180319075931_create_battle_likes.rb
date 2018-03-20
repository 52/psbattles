class CreateBattleLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :battle_likes do |t|
      t.references :battle, foreign_key: true
      t.references :user,   foreign_key: true

      t.timestamps
    end

    add_index :battle_likes, [:battle_id, :user_id], unique: true
  end
end
