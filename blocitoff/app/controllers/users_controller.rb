class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @users = User.all
  end

  def show
    if user_signed_in?
      @email = current_user.email
      @sign_in = current_user.last_sign_in_at
      @items = current_user.items
    else
      redirect_to root_path
    end
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end
