require 'rails_helper'
require 'pry'

RSpec.describe 'Hackathons API Specs', :type => :request do
        fixtures :users
        fixtures :hackathons
        fixtures :hackathon_phases
    describe 'endpoint => /api/hackathons/' do 
        it 'should respond to api/hackathon/index' do
            get '/api/hackathons/index'
            expect(response).not_to eq(nil)
        end

        it 'should show completed hackathons if user is authenticated' do
            completed_hackathon = hackathons(:hackathon_one)
            completed_hackathon.hackathon_phases << HackathonPhase.all
            completed_hackathon.users << users(:miguel)
            get '/api/hackathons/', params: {}, headers: { Authentication: users(:miguel).authentication_token }
            json = JSON.parse(response.body)
            # binding.pry
            expect(json["hackathons"].class).to eq(Array)
        end

        it 'should respond with an error if the user is not authenticated' do
           get '/api/hackathons/index'
           json = JSON.parse(response.body)
           expect(json['message']).to eq("token authentication error, please try logging in again.")
        end
    end

    describe 'endpoint=> /hackathons/:id' do
        it 'should respond to /api/hackathons/:id' do
            get '/api/hackathons/1'
            expect(response).not_to eq(nil)
        end

        it 'should show a hackathon when the user is authenticated' do
            get '/api/hackathons/1', params: {}, headers: {Authentication: users(:miguel).authentication_token }
            binding.pry

        end 

        it 'should respond with an error if the user is not authenticated' do

        end
    end
end