class CreateJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :hashtags_questions, id: false do |t|
      t.integer :question_id, index: true
      t.integer :hashtag_id, index: true
    end
  end
end