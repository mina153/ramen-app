class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :move, only: [ :show, :edit, :update]
  
  def show
  end

  def edit
  end

  def update 
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :nickname)
  end

  def move 
    @user = User.find(params[:id])
  end

end


