module SessionsHelper
  def log_in(user)
    #creates session with the user.id stored as user_id
    session[:user_id] = user.id
  end

  # returns current logged-in user
  def current_user
    #checks to see if @current_user is set. if it isn't, find it via session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
