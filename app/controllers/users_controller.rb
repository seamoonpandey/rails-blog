class UsersController < ApplicationController

    before_action :set_user, only: [:edit, :update, :show]
    before_action :require_same_user, only: [:edit, :update]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def edit
        
    end

    def show
        
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Welcome to the rails blog #{@user.username}"
            redirect_to user_path(@user)
        else
            flash[:danger] = "Couldn't create user."
            render 'new'
        end
    end

    def update
        
         if @user.update(user_params)
            flash[:success]="Account was updated successfully"
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end

    

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    def set_user
        @user = User.find(params[:id])
    end    
    
    def require_same_user
        if current_user != @user
            flash[:danger] = "You can only edit your own account"
            redirect_to root_path
        end
    end
end