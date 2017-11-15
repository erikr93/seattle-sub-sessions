class UserController < ApplicationController
    def index
        @users = User.all
        @events = Event.all
      end

      def create
        User.create(user_params)
        redirect_to root_path
      end

      def edit
        @user = User.find(params[:id])
      end

      def update
        puts "editing user"
        u = User.find(params[:id])
        u.update(user_params)
        redirect_to user_path
      end

      def new
        @user = User.new
      end

      def destroy
        puts "user_controller to destroy account"
        u = User.find(params[:id])
        u.destroy
        redirect_to new_user_path
      end

      def show
        puts "user_controller pointing to SHOW ROUTE"
        @user = User.find(params[:id])
      end

      def user_params
       params.require(:user).permit(:name, :email, :password)
      end

end
