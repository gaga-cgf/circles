# frozen_string_literal: true

module UserSession
  def self.included(klass)
    klass.class_eval do
      helper_method :logged_in?
      helper_method :current_user
    end
  end

  def signin_user(user)
    session[:user_id] = user.id
  end

  def logout_user
    session[:user_id] = nil
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end
end
