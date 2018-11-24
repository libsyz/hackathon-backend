class HackathonsController < ApplicationController
    
    def index
        @hackathons = Hackathon.all
        render :hackathons_index
    end

    def create

     @hackathon = Hackathon.new
     @hackathon.users << User.find(4)
        if @hackathon.save 
            render json: { hackathon_id: @hackathon.id  }
        else 
            render json: { message: "Something went wrong", error: @hackathon.errors.messages }
        end
    end

    private

    def hackathon_params
        params.permit!
    end
end
