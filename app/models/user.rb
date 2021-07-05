
class User 
  include Mongoid::Document
  # must add the below code because we use mongodb, this gives us the "has_secure_password"
  include ActiveModel::SecurePassword 
  has_secure_password
  field :email, type: String
  field :password_digest, type: String
  belongs_to :account
  validates :email, :password_digest, length: {minimum: 2}, allow_blank: false
end

