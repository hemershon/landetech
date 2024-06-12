require 'faker'

recruiter = Recruiter.create!(
  name: 'hemershon',
  email: 'testando@gmail.com',
  password: '1234567'
)

100.times do
  Job.create!(
    title: "Software Developer",
    description: "Develop and maintain web applications",
    start_date: "2024-06-01",
    end_date: "2024-12-31",
    status: "active",
    skills: "Ruby, Rails, JavaScript",
    recruiter_id: recruiter.id,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  )
end
