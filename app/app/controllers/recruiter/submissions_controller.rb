class Recruiter::SubmissionsController < ApplicationController
  def create
    @submission = Submission.new(submission_params)

    if @submission.save
      render json: @submission, status: :created
    else
      error_message = Submission.exists?(email: @submission.email, job_id: @submission.job_id) ? 'You have already applied for this job' : @submission.errors.full_messages
      render json: { error: error_message }, status: :unprocessable_entity
    end
  end


  private

  def submission_params
    params.require(:submission).permit(:name, :email, :mobile_phone, :resume, :job_id)
  end

  def find_submission
    @submission = Submission.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Você já se cadastrou nessa vaga" }, status: :not_found
  end
end
