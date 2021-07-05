class RatingQuestionsController < ApplicationController
  def index
    @rating_questions = RatingQuestion.all
  end

  def new
    @rating_question = RatingQuestion.new
  end
 
  def show
    @rating_question = RatingQuestion.find(params[:id])
  end

  def create
    @rating_question = RatingQuestion.create(question_params)
    if @rating_question.save
      respond_to do |format|
        format.html { redirect_to '/', notice: "Your question has been created." }
        format.json { render 'show', status: 201 }
      end
    end
  end

  def edit
    @rating_question = RatingQuestion.find(params[:id])
  end

  def update
    @rating_question = RatingQuestion.find(params[:id])
    @rating_question.update(title: params[:title])
    @rating_question.save
  end

  def destroy
    @rating_question = RatingQuestion.find(params[:id])
    @rating_question.destroy
  end

  private

  def question_params
    params.require(:rating_question).permit(:title)
  end
end
