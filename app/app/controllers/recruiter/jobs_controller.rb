class Recruiter::JobsController < ApplicationController
  before_action :authorized

  def index
    @jobs = current_recruiter.jobs.page(params[:page]).per(10)
    render json: @jobs
  end

  def show
    @job = current_recruiter.jobs.find(params[:id])
    render json: @job
  end

  def create
    @job = current_recruiter.jobs.build(job_params)
    if @job.save
      render json: @job, status: :created
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def update
    @job = current_recruiter.jobs.find(params[:id])
    if @job.update(job_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @job = current_recruiter.jobs.find(params[:id])
    @job.destroy
    head :no_content
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :start_date, :end_date, :status, :skills, :recruiter_id)
  end
end
