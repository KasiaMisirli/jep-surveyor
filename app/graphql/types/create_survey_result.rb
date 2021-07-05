module Types
  class CreateSurveyResult < BaseUnion
    possible_types SurveyType, ErrorMessage

    def self.resolve_type(object, _context)
      if object.persisted?
        SurveyType
      else
        ErrorMessage
      end
    end
  end
end