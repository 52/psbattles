class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.string     :link
      t.integer    :points, default: 1
      t.string     :title
      t.text       :description
      t.references :user, foreign_key: true
      t.references :battle, foreign_key: true

      t.timestamps
    end
  end
end
