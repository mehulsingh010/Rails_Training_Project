class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]
  # all user
    def index
        @users =User.all
        render json: @users
    end

    # single user
    def show
      @user = User.find(params[:id])
      render json: @user
    end
    # post
    def create
      @user = User.new(user_params)
        if @user.save
          render json: { status: "Success", message: "User created", data: @user }, status: :created
        else
          render json: { status: "Error", message: "User not created", errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

      def user_params
        params.require(:user).permit(:name, :email, :phone_number, :password, :role_id)
      end

      def set_user
        @user = User.find(params[:id])
      end
end