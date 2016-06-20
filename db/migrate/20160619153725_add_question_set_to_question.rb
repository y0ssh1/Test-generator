class AddQuestionSetToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :question_set, index: true, foreign_key: true
  end
end
