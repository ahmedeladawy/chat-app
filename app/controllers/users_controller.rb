class UsersController < ApplicationController
   def new
     @user = User.new
   end

   def create
     @user = User.new user_params
     if @user.save
       session[:user_id] = @user.id
       redirect_to users_path, notice: "Logged In!"
     else
       render :new
     end
   end

   def show
     @user = User.find(params[:id])
   end

   def edit
     @user = User.find(params[:id])
   end

    def update
      @user = User.find(params[:id])
      if @user.authenticate(params[:user][:current_password]) && @user.update_attributes(user_params)
        flash[:success] = "Profile updated"
        redirect_to user_path(@user)
      else
        render 'edit'
      end
    end

   def index
     @users = User.all.order('created_at desc')
   end


   private

   def user_params
     params.require(:user).permit(:first_name, :last_name, :email, :username,
                                               :password, :password_confirmation,
                                               :image)
   end
end
