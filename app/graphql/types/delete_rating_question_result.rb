module Types
  class DeleteRatingQuestionResult < BaseUnion
    possible_types QuestionType, ErrorMessage

    def self.resolve_type(object, _context)
      object.persisted? ? ErrorMessage : QuestionType
    end
  end
end