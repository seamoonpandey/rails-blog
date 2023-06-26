class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome to the rails blog #{@user.username}"
            redirect_to user_path(@user)
        else
            flash[:danger] = "Couldn't create user."
            render 'new'
        end
    end

    def update
         @user = User.find(params[:id])
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
end