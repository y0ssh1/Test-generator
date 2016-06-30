class QuestionSet < ActiveRecord::Base
  belongs_to :user
  has_many :questions, dependent: :destroy

  def owner?(u)
    u == user
  end
end
