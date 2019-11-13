class ApplicationController < ActionController::Base
  include ApplicationHelper

  def logged_in
    redirect_to users_path, notice: "Please log in" unless current_user
  end
end

