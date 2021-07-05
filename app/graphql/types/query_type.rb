module Types
  class QueryType < Types::BaseObject

    field :questions, [QuestionType], null: false
 
    field :surveys, [SurveyType], null: false

    field :all_questions_by_survey, [QuestionType], null: false do
      argument :id, ID, required: true
    end

    def questions
      RatingQuestion.all
    end

    def all_questions_by_survey(id:)
      survey = Survey.find(id)
      found_survey_id = survey.id.to_s
      questions_per_survey = RatingQuestion.where(survey_id:found_survey_id)
      questions_per_survey
    end

    def surveys
      Survey.all
    end
  end
end
