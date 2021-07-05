module Login
  class LoginType < BaseObject
    field :email, String, null: false
    field :password, String, null: false
  end
end