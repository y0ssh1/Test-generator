class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /questions/test
  def test
    @targets = []
    max_blank_counts = (params[:size] || "20").to_i
    blank_counts = 0
    Question.order("RANDOM()").each do |question|
      blank_counts += question.body.scan(/_____/).size
      @targets << question
      break if blank_counts >= max_blank_counts
    end

    session[:question] = @targets.map { |t| t.id }
  end

  # GET /questions/result
  def result
    hash = Question.find(session[:question]).map{ |model| [model.id, model] }.to_h # 該当する３つの文とIDを見つける（順番は適当）
    @targets = session[:question].map { |id| hash[id] } # 問題文の順番にmodelを並び変える．
    @responses = @targets.map.with_index { |v, i| params[i.to_s] } # テキストボックスの値を受け取る
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:body, :answer)
    end
end
