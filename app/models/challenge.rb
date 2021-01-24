class Challenge < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
end
