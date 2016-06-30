class QuestionSetsController < ApplicationController
  def show
    @question_set = QuestionSet.find(params[:id])
  end

  def delete
  end

  def test
    @targets = []
    blank_counts_max = params[:size].try(:to_i) || 114514
    blank_counts = 0

    QuestionSet.find(params[:question_set_id]).questions.order("RANDOM()").each do |question|
      @targets << question
      blank_counts += question.body.scan(/_____/).size
      break if blank_counts >= blank_counts_max
    end

    session[:question] = @targets.map { |t| t.id }
  end

  def result
    hash = Question.find(session[:question]).map{ |model| [model.id, model] }.to_h # 該当する３つの文とIDを見つける（順番は適当）
    @targets = session[:question].map { |id| hash[id] } # 問題文の順番にmodelを並び変える
    @responses = @targets.map.with_index { |v, i| params[i.to_s] } # テキストボックスの値を受け取る
  end
end
