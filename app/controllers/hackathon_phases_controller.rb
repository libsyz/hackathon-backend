class HackathonPhasesController < ApplicationController
  before_action :phase_params 
  before_action :authenticate_request
  
  def edit
    # Make sure params to edit are prefixed with edit_ and match database destination
    # => examples params[:edit_problem_statement] // params [:edit_image_url]

    @hackathon = Hackathon.find(params['hackathon_id'])
    @phase = @hackathon.hackathon_phases.where(phase_number: params['phase_number']).first
    @phase.update(params)
    if @phase.save
      render :edit
    else
      render json: { error: "Something went wrong"}
    end
  end
  
  private 
  
  def phase_params
    params.permit!
  end
end
