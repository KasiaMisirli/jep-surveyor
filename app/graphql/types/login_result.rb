module Types
  class LoginResult < BaseUnion
    possible_types SuccessfulLoginResult, FailedLoginResult

    def self.resolve_type(object, _context)
      object.persisted? ? SuccessfulLoginResult : FailedLoginResult
    end
  end
end