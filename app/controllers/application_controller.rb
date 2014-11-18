class ApplicationController < ActionController::Base
  helper :all
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def cart_session
    @cart_session ||= CartSession.new(session)
  end

  helper_method :cart_session
end
