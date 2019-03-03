# require 'pry'

class RatingQuestionsController < ApplicationController
  before_action :set_rating_question, only: [:show, :update, :destroy]

  def index
    @rating_questions = RatingQuestion.all
  end

  def new
    @rating_question = RatingQuestion.new
  end
  
  def question_params
    params.require(:rating_question).permit(:title, :tag)
  end

  def create
   if request.body.size.zero?
    return render json: {}, status: 400
   end
    @rating_question = RatingQuestion.create(question_params)
    if @rating_question.save
      respond_to do |format|
        format.html { redirect_to "/rating_questions", notice: "Your question has been created." }
        format.json { render :show, status: 201 }
      end
    else
      respond_to do |format|
        errors = {"errors" => @rating_question.errors.messages}
        format.html { redirect_to "/rating_questions/new", notice: "Must have a title" }
        format.json { render json: errors, status: 422 }
      end
    end
  end

  def destroy
    @rating_question = RatingQuestion.find(params[:id])
    @rating_question.destroy
    redirect_to "/rating_questions"
    return 204
  end

  def edit
    @rating_question = RatingQuestion.find(params[:id])
  end

  def update
    if @rating_question.update(question_params)
      respond_to do |format|
        format.html { redirect_to "/rating_questions", notice: "Your question has been updated." }
        format.json { render :show, status: 200 }
      end
    else
      respond_to do |format|
        errors = {"errors" => @rating_question.errors.messages}
        format.html { redirect_to "/rating_questions/edit", notice: "Must have a title" }
        format.json { render json: errors, status: 422 }
      end
    end
  end

  def set_rating_question
    @rating_question = RatingQuestion.find(params[:id])
    unless @rating_question
      head 404
      return
    end
  end
end
