class RecruitersController < ApplicationController
  def create
    @recruiter = Recruiter.new(recruiter_params)
    if @recruiter
      token = encode_token({ recruiter_id: @recruiter.id })
      render json: { recruiter: @recruiter, token: token }, status: :ok
    else
      render json: { error: @recruiter.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    @recruiter = Recruiter.find_by(name: recruiter_params[:name])
    if @recruiter
      token = encode_token({ recruiter_id: @recruiter.id })
      render json: { recruiter: @recruiter, token: token }, status: :ok
    else
      render 'login', status: :ok
    end
  end

  private

  def recruiter_params
    params.require(:recruiter).permit(:name, :email, :password, :password_confirmation)
  end
end
