class QuestionSet < ActiveRecord::Base
  has_many :questions, dependent: :destroy
end
