# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(session_params[:email])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to users_path, alert: "user doesn't exist"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to users_path
  end

  def new
    @user = User.new
  end

  private

  def session_params
    params.require(:user).permit(:email)
  end
end
