class V1::RegistrationsController < Devise::SessionsController
    before_action :registration_params

    def create
      binding.pry
      @user = User.new(registration_params)
      @user.avatar_pic = AvatarFactory.generate_avatar
      if @user.save && @user.valid?
        render :user
      else
        puts @user.errors.messages
        head(:unauthorized)
      end
    end

    def registration_params
        params.permit(:name,:email, :surname, :password, :position, :company)
    end

end