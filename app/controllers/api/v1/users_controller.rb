class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show,  :update ,:destroy]
  # all user
    def index
        @users =User.all
        render json: @users,status: 200
    end

    # single user
    def show
      if @user 
        render json: @user,status: 200
      else 
        render json: {error: "User Not Found."}
      end
    end
    # post
    def create
      @user = User.new(user_params)
        if @user.save
          # debugger
          render json: { status: "Success", message: "User created", data: @user }, status: :created
        else
          render json: { status: "Error", message: "User not created", error: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update 
      unless @user.update(user_params)
        render json: {errors: @user.errors.full_message},
               status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy 
    end

    private

      def user_params
        # debugger
        params.require(:user).permit([:name, :email, :phone_number, :password, :role_id])
      end

      def set_user
        @user = User.find(params[:id])
      end
end