class RatingQuestion
  include Mongoid::Document

  field :title, type: String
  field :tag, type: String
  belongs_to :survey
  validates :survey_id, presence: true
end
