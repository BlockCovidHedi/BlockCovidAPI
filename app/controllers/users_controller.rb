class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if(@user.role=='doctor')
      @doctor = @user.build_doctor(doctor_params(@user.id))
    elsif(@user.role=='establishment')
      @establishment = @user.build_establishment(establishment_params(@user.id))
    end

    User.transaction do
      if @user.save!
        if(@user.role == 'doctor')
          if @doctor.save!
            render json: [@user, @doctor]
          else
            render json: @doctor.errors, status: :unprocessable_entity
          end
        elsif(@user.role == 'establishment')
          if @establishment.save!
            render json: [@user, @establishment]
          else
            render json: @establishment.errors, status: :unprocessable_entity
          end
        else
          render json: error
        end
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.permit(:email, :role, :password, :password_confirmation, :password_digest)
  end
  def doctor_params(user_id)
    params.permit(:name, :first_name, :inami, :phone_number, user_id)
  end
  def establishment_params(user_id)
    params.permit(:name, :phone_number, user_id)
  end
end
