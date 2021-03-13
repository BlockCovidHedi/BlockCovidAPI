class LoginController < ApplicationController
  def login
    @user = User.find_by(email: login_params[:email])
    if @user && @user.authenticate(login_params[:password])
      token = JWT.encode({user_id: @user.id}, 'test', 'HS256')
      render json: {user: @user, token: token}
    else
      render json: {errors: @user.errors.full_messages}
    end

  end

  def persist
    if request.headers['Authorization']
      puts request.headers['Authorization']
      encoded_token = request.headers['Authorization'].split(' ')[1]
      puts encoded_token
      token = JWT.decode(encoded_token, 'test')
      user_id = token[0]['user_id']
      user = User.find(user_id)
      if(user.role == 'doctor')
        doctor = Doctor.find_by('user_id':user.id)
        render json: {user: user, doctor: doctor }
      elsif(user.role == 'establishment')
        establishment = Establishment.find_by('user_id':user.id)
        render json: {user: user, establishment: establishment}
      end
      render json: error
    end
  end


  def login_params
    params.permit(:email, :password)
  end
end