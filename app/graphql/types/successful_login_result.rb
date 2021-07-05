module Types
  class SuccessfulLoginResult < BaseObject
    field :email, String, null: true
    field :password, String, null: true
    
  end
end