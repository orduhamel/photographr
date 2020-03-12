class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    tasks_path(current_user) #your path
  end

  def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
