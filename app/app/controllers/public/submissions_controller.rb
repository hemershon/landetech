class Public::SubmissionsController < ApplicationController
  skip_before_action :authenticate_recruiter!

  def create
    @submission = Submission.new(submission_params)
    if Submission.exists?(email: @submission.email, job_id: @submission.job_id)
      render json: { errors: 'You have already applied for this job' }, status: :unprocessable_entity
    elsif @submission.save
      render json: @submission, status: :created
    else
      render json: @submission.errors, status: :unprocessable_entity
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:name, :email, :mobile_phone, :resume, :job_id)
  end
end
