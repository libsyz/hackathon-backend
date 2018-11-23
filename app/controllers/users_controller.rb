class UsersController < ApplicationController
    def index
     @users = User.all
     render :users_index
    end

    def show
     @user = User.where(id: params['id']).first
     if @user
        render :user
     else
        render json: { error_message: 'User Not Found!' }, status: :ok
     end
    end

    private

    def user_params
       params.permit!
    end
end
