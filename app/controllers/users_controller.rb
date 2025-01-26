class UsersController < ApplicationController

    # index refer to file in view/users name that is the root of users
    def index
        @uers = User.all
    end

     # GET /users/new
    def new
        @user = User.new
    end

    # show means the specific users 
  #GET /users/1
    def show
        @user = User.find(params[:id])
    end

    def edit 
        @user = User.find(params[:id])
    end

    #post /users creating new users
    def create 
        @user = User.new(use_params)
        respond_to do |format|
            if @user.save 
                format.html {redirect_to @user, notice: "User was successfully created."}
            else
                format.html {render :new}
            end 
        end
    end    

    # update method 
    # PUT/PATCH users/1
    def update
        respond_to do |format|
          if @user.update(user_params)
            format.html {redirect_to @user, notice: "user was succesfully updated"}
          else  
            format.html { render :edit }
          end
        end
    end

    #delete user
    def destroy
        @user = User.find(params[:id]) 
        if @user.destroy
          redirect_to user_path, notice: "User was successfully deleted"
        else
          redirect_to user_path, alert: "There was problemn deletign the user"
        end
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :phone_number, :role_id )
    end
end
