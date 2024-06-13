class Public::JobsController < ApplicationController

  def index
    @jobs = Job.where(status: 'ativo')
    if params[:query].present?
      @jobs = @jobs.where("title ILIKE ? OR description ILIKE ? OR skills ILIKE ?",
                          "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
    end
    @jobs = @jobs.limit(10)
    render :index
  end

  def show
    @job = Job.find(params[:id])
    render :show
  end
end
