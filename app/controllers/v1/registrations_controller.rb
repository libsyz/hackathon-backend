class V1::RegistrationsController < Devise::SessionsController
    def create
      @user = User.new
      @user.email = registration_params[:email]
      @user.password = registration_params[:password]

      if @user.save
        current_user = @user
        render :user
      else
        puts @user.errors.messages
        head(:unauthorized)
      end
    end

    def registration_params
        params.permit!
    end

end