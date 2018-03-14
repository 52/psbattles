class CreateBattles < ActiveRecord::Migration[5.1]
  def change
    create_table :battles do |t|
      t.string     :title

      # Link to the imgur jpeg image
      # Example: https://i.imgur.com/image_hash.jpg
      t.string     :link

      t.integer    :points, default: 1
      t.text       :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
