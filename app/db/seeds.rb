require 'faker'

recruiter = Recruiter.create!(
  name: 'hemershon',
  email: 'testando@gmail.com',
  password: '1234567'
)

100.times do
  Job.create!(
    title: Faker::Job.title,
    description: "Ruby",
    start_date: Faker::Date.forward(days: 23),
    end_date: Faker::Date.backward(days: 14),
    status: %w[ativo inativo].sample,
    skills: Faker::Job.field,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    recruiter: recruiter
  )
end
