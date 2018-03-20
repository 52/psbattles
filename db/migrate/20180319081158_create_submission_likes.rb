class CreateSubmissionLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :submission_likes do |t|
      t.references :submission, foreign_key: true
      t.references :user,       foreign_key: true

      t.timestamps
    end

    add_index :submission_likes, [:submission_id, :user_id], unique: true
  end
end
