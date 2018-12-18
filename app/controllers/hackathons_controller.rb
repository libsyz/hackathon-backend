class HackathonsController < ApplicationController
  before_action :authenticate_request
  
  
  def index
    @hackathons = Hackathon.where(completed: true).all
    render :index
  end
  
  def create
    @hackathon = Hackathon.new
    @hackathon.generate_phases
    @hackathon.users << @user
    if @hackathon.save 
      render :create
    else 
      render json: { message: "Something went wrong", error: @hackathon.errors.messages }
    end
  end 
  
  def show
    @hackathon = Hackathon.find(params[:id])
    render :show
  end
  
  def add_hacker
    params_to_entities
    clear_previous_selection
    add_user = @hackathon.add_user(@user)
    if add_user == StandardError
      restore_previous_selection
      @hackathon.save
      render json: {error: "User was already selected", status: "already selected"}
    else
      @hackathon.save
      render :add_hacker
    end
  end
  
  def remove_hacker
    params_to_entities
    clear_previous_selection
    if @hackathon.save 
      render json: {message: "removed user #{@previous_selection.name} // id: #{@user.id} from hackathon no. #{@hackathon.id}",
      status: "ok"}
    else 
      render json: {message: "something went wrong"}
    end
  end
  
  def update 
    
    @hackathon = Hackathon.find(params[:id])
    @hackathon.title = params[:title]
    @hackathon.completed = true
    if @hackathon.save
      render :show
    else
      render json: {message: "something went wrong"} 
    end
  end
  
  
  private
  
  def hackathon_params
    params.permit!
  end
  
  
  def params_to_entities
    @hackathon = Hackathon.find(hackathon_params[:hackathon_id])
    if !hackathon_params[:hacker_id].nil?
      @user = User.find(hackathon_params[:hacker_id])
    end
    if !hackathon_params[:hacker_in_slot_id].nil?
      @previous_selection = User.find(hackathon_params[:hacker_in_slot_id])
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
  
end
