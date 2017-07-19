class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

rescue_from Pundit::NotAuthorizedError, with: :not_authorized

private

def not_authorized
  flash[:danger]='You arent allowed to do that.'
  redirect_to root_path
end
end
