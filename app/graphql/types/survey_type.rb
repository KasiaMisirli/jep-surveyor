module Types
  class SurveyType < BaseObject
    field :name, String, null: true
    field :id, ID, null: true
    field :questions, [QuestionType], null: false

  end
end

