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
      params_to_entities
      clear_previous_selection
      add_user = @hackathon.add_user(@user)
      if add_user == StandardError
        restore_previous_selection
        render json: {error: "User was already selected", status: "already selected"}
      else
        render :add_hacker
      end
    end
    
    def clear_previous_selection
      if @previous_selection
        @hackathon.users.delete(@previous_selection.id)
      end
    end

    def restore_previous_selection
      if @previous_selection
        @hackathon.users << @previous_selection
      end
    end

    def show
      @hackathon = Hackathon.find(params[:id])
      render :show
    end

    private

    def hackathon_params
        params.permit!
    end

    def params_to_entities
      @hackathon = Hackathon.find(hackathon_params[:hackathon_id])
      @user = User.find(hackathon_params[:hacker_id])
      if !hackathon_params[:hacker_in_slot_id].nil?
        @previous_selection = User.find(hackathon_params[:hacker_in_slot_id])
      end
    end
end
