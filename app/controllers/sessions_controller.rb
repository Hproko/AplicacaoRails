class SessionsController < ApplicationController
  before_action :block_access, except: [:destroy]
  def create
    @user = User.find_by(username: params[:session][:username])
    if @user 
      @user = User.find_by(password: params[:session][:password])
      if @user
        sign_in
        redirect_to '/home/principal'
      else
        render 'new', notice: "Usuario ou senha incorretos!"
      end
    else
      render 'new', notice: "Usuario ou senha incorretos!"
    end
    
  end

  def destroy
    sign_out
    redirect_to root_url
  end
  
end