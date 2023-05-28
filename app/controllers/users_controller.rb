class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit    
  end

  def update
    byebug
    if @user.update(name: user_params[:name])
      format.js
    else
    end
  end

  private

  def set_user
    @user = User.last
  end

  def user_params
    params.require(:user).permit(:name)
  end
  
end
