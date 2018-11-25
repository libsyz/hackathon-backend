class HackathonsController < ApplicationController
    before_action :authenticate_request
    
    def index
      @hackathons = Hackathon.all
      render :hackathons_index
    end

    def create
      @hackathon = Hackathon.new
      @hackathon.users << @user
        if @hackathon.save 
            render json: { hackathon_id: @hackathon.id, hackathon_users: @hackathon.users }
        else 
            render json: { message: "Something went wrong", error: @hackathon.errors.messages }
        end
    end

    def add_hacker
      @hackathon = Hackathon.find(hackathon_params[:id])
      @user = User.find(hackathon_params[:user_id])
      @hackathon << @user
      if @hackathon.save
        render json: {message: "it's all good"}
      else 
        render json: {message: "something did not work"}
      end
    end

    private

    def hackathon_params
        params.permit!
    end
end
