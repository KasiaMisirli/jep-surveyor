module Types
  class QuestionType < BaseObject
    field :title, String, null: true
    field :tag, String, null: true
    field :id, ID, null: true
    field :survey_id, ID, null: true
  end
end