class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :body
      t.string :answer
      t.string :comment

      t.timestamps null: false
    end
  end
end
