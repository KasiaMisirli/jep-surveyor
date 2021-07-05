module Types
  class CreateRatingQuestionResult < BaseUnion
    possible_types QuestionType, FailedCreateRatingQuestionResult

    def self.resolve_type(object, _context)
      object.persisted? ? QuestionType : FailedCreateRatingQuestionResult
    end
  end
end