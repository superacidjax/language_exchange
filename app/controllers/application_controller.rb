class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_authenticated
    redirect_to sign_in_path, :alert => "First login to access this page."
  end

end
