class Question < ApplicationRecord
  validates :question, presence: true

  has_many :responses
  belongs_to :user
end
