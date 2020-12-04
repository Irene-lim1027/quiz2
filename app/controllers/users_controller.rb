class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update, :password_edit, :password_update]
  before_action :find_user, only: [:edit, :update,:password_edit, :password_update]
  before_action :authorize, only: [:edit, :update, :password_edit, :password_update] 

    def new
        @user = User.new
      end
    
    def create
        @user = User.new user_params
        if @user.save  
          session[:user_id] = @user.id 
          redirect_to root_path
        else
          render :new
        end
    end

 private
    
    def user_params
        params.require(:user).permit(
          :first_name,
          :last_name,
          :email,
          :password,
          :password_confirmation,
        )
    end

    def find_user
      @user = User.find params[:id]
    end
  
    def authorize 
      unless can? :crud, @user
        flash[:danger] = "Not Authorized"
        redirect_to root_path
      end

end
