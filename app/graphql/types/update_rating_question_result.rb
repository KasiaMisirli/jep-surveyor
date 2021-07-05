module Types
  class UpdateRatingQuestionResult < BaseUnion
    possible_types QuestionType, NoUpdateErrorMessage

    def self.resolve_type(object, _context)
      object.persisted? ? QuestionType : NoUpdateErrorMessage
    end
  end
end