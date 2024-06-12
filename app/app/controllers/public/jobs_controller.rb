class Public::JobsController < ApplicationController

  def index
    @jobs = Job.where(status: 'active').limit(10)
    if params[:query].present?
      @jobs = @jobs.where("title ILIKE ? OR description ILIKE ? OR skills ILIKE ?",
                          "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
    render json: @jobs
    end
  end

  def show
    @job = Job.find(params[:id])
    render json: @job
  end
end
