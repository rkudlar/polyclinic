module Admins
  class UsersController < AdminController
    def index
      @users = User.all
    end

    def destroy
      user.destroy!
      redirect_to admins_users_path
    end

    private

    def user
      @user = User.find(params[:id])
    end
  end
end
