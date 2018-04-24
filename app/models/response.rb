class Response < ApplicationRecord
  validates :response, presence: true

  belongs_to :user
end
