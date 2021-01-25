class Challenge < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
  has_many :votes

  def voted_by?(user)
    votes.exists?(user: user)
  end
end
