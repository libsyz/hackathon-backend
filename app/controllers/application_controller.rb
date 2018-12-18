class ApplicationController < ActionController::API
  
  private
  
  def authenticate_request
    
    token = request.headers['Authentication']
    
    if token
      @user = User.where(authentication_token: token).first
    else
      render json: { message: "token authentication error, please try logging in again." }
    end
  end
end
