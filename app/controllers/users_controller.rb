class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]

  def index 
    @users = User.all
  end

  def show
    @user = User.find (params[:id])
  end
  
  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    @user.user_type = 'N'
    if @user.save
      redirect_to  '/home/principal', notice: "Usuario criado com sucesso!"
      sign_in
    else
      render action: :new
    end
  end

  private 
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
