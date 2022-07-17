class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :new, :welcome]
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to '/welcome'
    else
       redirect_to '/login'
    end
 end

  def destroy
      session.delete(:user_id)

      session.clear
      redirect_to '/welcome'
  end
end
