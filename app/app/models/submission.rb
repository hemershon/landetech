class Submission < ApplicationRecord
  belongs_to :job
  validates :name, presence: true
  validates :email, presence: true
  validates :mobile_phone, presence: true
  validates :resume, presence: true
  validates :job_id, presence: true
end
