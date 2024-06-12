class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, 'jwt_secret_key')
  end

  def decode_token
    auth_header = request.headers['Authorization']
    if auth_header
      token = auth_header.split(' ').last
      begin
        JWT.decode(token, 'jwt_secret_key', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def authorized_user
    decoded_token = decode_token
    if decoded_token
      recruiter_id = decoded_token[0]['recruiter_id']
      @recruiter = Recruiter.find_by(id: recruiter_id)
    end
  end

  def authorized
    render json: { message: 'You need to log in' }, status: :unauthorized unless authorized_user
  end

  def current_recruiter
    authorized_user
  end
end
