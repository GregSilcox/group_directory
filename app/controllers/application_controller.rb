class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Check if there is a before_action that requires authentication
  # before_action :authenticate_user! # This might be causing the redirection
end
