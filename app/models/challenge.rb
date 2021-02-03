class Challenge < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
  has_many :votes, dependent: :destroy
  has_many :collaborate, dependent: :destroy
  has_many :tags, dependent: :destroy

  def voted_by?(user)
    votes.exists?(user: user)
  end

  def collaborated_by?(user)
    collaborate.exists?(user: user)
  end

  def collaboraters_name(challenge_id)
    name_string = []
    user_id = Collaborate.select(:user_id).where(challenge_id: challenge_id)
    user_id.each do |user|
      name_string << User.find(user.user_id).empid
    end
    return(name_string)
  end
end
