require 'rails_helper'
require 'pry'

RSpec.describe 'Hackathons API Endpoint Specs', :type => :request do
        fixtures :users
        fixtures :hackathons
        fixtures :hackathon_phases 

    describe 'endpoint => /api/hackathons/' do 
        it 'should respond to api/hackathon/index' do
            get '/api/hackathons/index'
            expect(response).not_to eq(nil)
        end

        it 'should show completed hackathons if the request is authenticated' do
            completed_hackathon = hackathons(:hackathon_one)
            completed_hackathon.hackathon_phases << HackathonPhase.all
            completed_hackathon.users << users(:miguel)
            get '/api/hackathons/', params: {}, headers: { Authentication: users(:miguel).authentication_token }
            json = JSON.parse(response.body)
            expect(json["hackathons"].class).to eq(Array)
        end


        it 'should respond with an error if the request is not authenticated' do
           get '/api/hackathons/'
           json = JSON.parse(response.body)
           expect(json['message']).to eq("token authentication error, please try logging in again.")
        end

        it 'should create a new hackathon via authenticated request' do 
            hack_count = Hackathon.all.length
            post '/api/hackathons/', params: {}, headers: {Authentication: users(:miguel).authentication_token}
            hack_count_new = Hackathon.all.length
            expect(hack_count).not_to eq(hack_count_new)
        end

    end

    describe 'endpoint=> /hackathons/:id' do
        it 'should respond to /api/hackathons/:id' do
            get '/api/hackathons/1'
            expect(response).not_to eq(nil)
        end

        it 'should show a hackathon if the request is authenticated' do
            completed_hackathon = hackathons(:hackathon_one)
            completed_hackathon.users << users(:miguel)
            completed_hackathon.hackathon_phases << HackathonPhase.all
            get '/api/hackathons/1', params: {}, headers: {Authentication: users(:miguel).authentication_token }
            json = JSON.parse(response.body)
            expect(json['hackathon']).not_to eq(nil)  
        end 

        it 'should respond with an error if the request is not authenticated' do
            get '/api/hackathons/1'
            json = JSON.parse(response.body)
            expect(json['message']).to eq("token authentication error, please try logging in again.")
        end

        it 'should add a title to a hackathon and mark it as completed via authenticated request' do
            hackathon_incomplete = hackathons(:hackathon_two)
            hackathon_incomplete.hackathon_phases << HackathonPhase.all
            hackathon_incomplete.users << users(:miguel)
            patch '/api/hackathons/2', params: {title: "A list apart"}, headers: {Authentication: users(:miguel).authentication_token}
            expect(Hackathon.find(2).title).to eq("A list apart")
            expect(Hackathon.find(2).completed).to eq(true)
        end
    end

end