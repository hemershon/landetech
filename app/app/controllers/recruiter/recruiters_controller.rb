class Recruiter::RecruitersController < ApplicationController
  def create
    @recruiter = Recruiter.create(recruiter_params)
    if @recruiter.save
      token = encode_token({ recruiter_id: @recruiter.id })
      render 'create', locals: { token: token }, status: :ok
    else
      render json: { error: @recruiter.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    @recruiter = Recruiter.find_by(name: recruiter_params[:name])
    if @recruiter && @recruiter.authenticate(recruiter_params[:password])
      token = encode_token({ recruiter_id: @recruiter.id })
      render 'login', locals: { token: token }, status: :ok
    else
      render json: { error: "Login not found" }, status: :unprocessable_entity
    end
  end

  private

  def recruiter_params
    params.permit(:name, email: :password_digest)
  end
end
