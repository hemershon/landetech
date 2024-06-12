class Recruiter < ApplicationRecord
  has_secure_password
  has_many :jobs, dependent: :destroy
  has_many :submissions, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
