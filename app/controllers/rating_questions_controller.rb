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
      render :show, status: 201
    else
      render json: {"errors"=>{"title"=>["can't be blank"]}}, status: 422
    end
  end

  def destroy
    @rating_question.destroy
  end

  def update
    @rating_question.update(question_params)
    render :show
  end

  def set_rating_question
    @rating_question = RatingQuestion.find(params[:id])
    unless @rating_question
      head 404
      return
    end
  end
end
