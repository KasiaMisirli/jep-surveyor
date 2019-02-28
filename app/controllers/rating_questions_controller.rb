# require 'pry'

class RatingQuestionsController < ApplicationController

  def index
    # @rating_questions = RatingQuestion.all
    @rating_questions = RatingQuestion.all
    @rating_questions.to_json
    # render json: serialize_question(@rating_questions), status: 200
  end

  def new
    @rating_question = RatingQuestion.new
  end
  
  def question_params
    params.require(:rating_question).permit(:title, :tag)
  end

  def serialize_question(question)
    {
      id: question.id.to_s,
      title: question.title,
      tag: question.tag
    }
  end

  def create
   if request.body.size.zero?
    return render json: {}, status: 400
   end
    @rating_question = RatingQuestion.create(question_params)
    if @rating_question.save
      render json: serialize_question(@rating_question), status: 201
    else
      render json: {"errors"=>{"title"=>["can't be blank"]}}, status: 422
    end
  end

  def destroy
    question = RatingQuestion.find(params[:id])
    return render json: {}, status: 404 unless question
    question.destroy
  end

  def show
    @rating_question = RatingQuestion.find(params[:id])
    return render json: {}, status: 404 unless @rating_question
    render json: serialize_question(@rating_question), status: 200
    # binding.pry
  end

  def update
    @rating_question = RatingQuestion.find(params[:id])
    return render json: {}, status: 404 unless @rating_question
    @rating_question.update(question_params)
    render json: serialize_question(@rating_question), status: 200
  end
end
