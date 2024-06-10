class Public::JobsController < ApplicationController
  skip_before_action :authenticate_recruiter!, only: [:index, :show]

  def index
    @jobs = Job.where(status: 'active')
    render json: @jobs
  end

  def show
    @job = Job.find(params[:id])
    render json: @job
  end
end
