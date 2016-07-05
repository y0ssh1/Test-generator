class QuestionSet < ActiveRecord::Base
  belongs_to :user
  has_many :questions, dependent: :destroy

  def owner?(u)
    u && u == user
  end

  def destroy_all_questions!
    questions.each do |question|
      question.destroy
    end
  end
end
