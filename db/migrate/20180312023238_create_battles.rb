class CreateBattles < ActiveRecord::Migration[5.1]
  def change
    create_table :battles do |t|
      t.string     :title

      # Imgur link, but store image_hash only
      # Format of the link: https://i.imgur.com/image_hash.jpg
      t.string     :link

      t.integer    :points, default: 1
      t.text       :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
