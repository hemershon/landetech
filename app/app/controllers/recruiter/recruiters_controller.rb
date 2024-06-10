class Recruiter::RecruitersController < ApplicationController
  def create
    @recruiter = Recruiter.create(recruiter_params)
    if @recruiter.valid?
      token = encode_token({ recruiter_id: @recruiter.id })
      render create, status: :ok
    else
      render json: { error: "User not found" }, status: :unprocessable_entity
    end
  end

  def login
    @recruiter = Recruiter.find_by(name: recruiter_params[:name])
    if @user
      token = encode_token({ recruiter_id: @recruiter.id })
      render :login, status: :ok
    else
      render json: { error: "Login not found" }, status: :unprocessable_entity
    end
  end

  private

  def recruiter_params
    params.permit(:name, :password)
  end
end
