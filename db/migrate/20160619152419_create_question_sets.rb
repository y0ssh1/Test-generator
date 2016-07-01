class CreateQuestionSets < ActiveRecord::Migration
  def change
    create_table :question_sets do |t|
      t.string :title
      t.string :comment
      
      t.timestamps null: false
    end
  end
end
