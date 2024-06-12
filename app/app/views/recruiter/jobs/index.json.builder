json.array! @jobs do |job|
  json.(job, :id, :title, :description, :start_date, :end_date, :status, :skills)
  json.recruiter do
    json.id job.recruiter.id
    json.name job.recruiter.name
    json.email job.recruiter.email
  end
end
