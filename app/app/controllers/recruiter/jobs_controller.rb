class Recruiter::JobsController < ApplicationController
  before_action :set_job, only: %i[show update destroy]

  def index
    @jobs = current_recruiter.jobs
    render json: @jobs
  end

  def create
    @job = current_recruiter.jobs.build(job_params)
    if @job.save
      render json: @job, status: :created
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @job
  end

  def update
    if @job.update(job_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @job.destroy
    head :no_content
  end

  private

  def set_job
    @job = current_recruiter.jobs.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :start_date, :end_date, :status, :skills)
  end
end
