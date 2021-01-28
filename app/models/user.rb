class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :challenges, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :collaborate, dependent: :destroy
  validates :empid, presence: true, uniqueness: { case_sensitive: false }
  attr_writer :login
  validates_format_of :empid, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  def login
    @login || self.empid || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["empid = :value OR lower(email) = lower(:value)", { :value => login }]).first
    elsif conditions.has_key?(:empid) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
