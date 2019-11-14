# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]


  def index
    @users = User.all
  end


  def show
    @created_u = @user.created_events.upcoming
    @attended_u = @user.attended_events.upcoming
    @created_p = @user.created_events.past
    @attended_p = @user.attended_events.past
  end


  def new
    @user = User.new
  end


  def edit
    redirect_to root_path, alert: "You can't do that" unless @user == current_user
  end


  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    redirect_to root_path, alert: "You can't do that" unless @user == current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    redirect_to root_path, alert: "You can't do that" unless @user == current_user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
