class UsersController < ApplicationController
    def index
     @users = User.all
     render :users_index
    end
end
