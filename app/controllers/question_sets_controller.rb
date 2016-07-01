class QuestionSetsController < ApplicationController
  def show
    @question_set = QuestionSet.find(params[:id])
  end

  def edit
    @question_set = QuestionSet.find(params[:id])
  end

  def update
    @question_set = QuestionSet.find(params[:id])
    @question_set.destroy_all_questions!
    params[:texts].each do |text|
      body = text.gsub(/<(.*?)>/, '_____')
      answer = text.scan(/<(.*?)>/).flatten.join(',')
      @question_set.questions << Question.create(body: body, answer: answer)
    end

    redirect_to action: 'show', id: params[:id]
  end

  def destroy
    QuestionSet.find(params[:id]).destroy

    redirect_to action: 'index'
  end

  def test
    @question_set = QuestionSet.find(params[:id])
    @targets = []

    blank_counts_max = params[:size].try(:to_i) || 114514
    blank_counts = 0

    @question_set.questions.order("RANDOM()").each do |question|
      @targets << question
      blank_counts += question.body.scan(/_____/).size
      break if blank_counts >= blank_counts_max
    end

    session[:question] = @targets.map { |t| t.id }
  end

  def result
    @question_set = QuestionSet.find(params[:id])
    @targets = @question_set.questions
    @responses = @targets.map.with_index { |v, i| params[i.to_s] } # テキストボックスの値を受け取る
  end
end
