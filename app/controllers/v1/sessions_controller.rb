class V1::SessionsController < Devise::SessionsController
    def create
        
        @user = User.find_by_email(user_params[:email])
        
        if @user && @user.valid_password?(user_params[:password])
            current_user = @user
            render :user 
        else
            render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
        end
    end
    
    def destroy 
        if @current_user
            message = "session for user has been destroyed"
            @current_user = nil
            render json: { message: { message => ['please proceed'] } }, status: :ok
        end
        render json: { message: { message => ['please proceed'] } }, status: :ok
    end
    
    def user_params
        params.permit!
    end
end
