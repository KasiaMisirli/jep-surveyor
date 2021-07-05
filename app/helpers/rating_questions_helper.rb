

module RatingQuestionsHelper
  def rating_question_props
    RatingQuestionProps.new(@rating_questions).to_props
  end

  def single_rating_question_props
    SingleRatingQuestionProps.new(@rating_question).to_props
  end
end
