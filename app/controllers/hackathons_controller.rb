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

      @hackathon = Hackathon.find(hackathon_params[:hackathon_id])
      @user = User.find(hackathon_params[:hacker_id])
      add_result = @hackathon.add_user(@user) if @hackathon && @user
      if add_result == StandardError
        render json: {error: "User was already selected"}
      else
        render :add_hacker
      end
    end

    private

    def hackathon_params
        params.permit!
    end
end
