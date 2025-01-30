class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update, :destroy]

    # index refer to file in view/users name that is the root of users
    def index
        @users = User.all
    end

    # GET /users/new
    def new
        @user = User.new
    end

    # show means the specific users
    # GET /users/1
    def show
        
    end

    def edit
        # @user = User.find(params[:id])
    end

    # post /users creating new users
    def create
      @user = User.new(user_params)
         if @user.save
           redirect_to @user, notice: "User was successfully created."
          else
            render :new ,status: :unprocessable_entity,alert: "Error While Creating New User"
         end
    end

    # update method
    # PUT/PATCH users/1
    def update
      if @user.update(user_params)
        redirect_to users_path, notice: "User was successfully updated"
      else
        render :edit
      end
    end

    # delete user
    def destroy

        if @user.destroy
          redirect_to users_path, notice: "User was successfully deleted"
        else
          redirect_to users_path, alert: "There was problemn deletign the user"
        end
    end

    def set_user
        @user = User.find(params[:id])
      end

    def user_params
        params.require(:user).permit(:name, :email, :password,:password_confirmation ,:phone_number, :role_id)
    end
end
