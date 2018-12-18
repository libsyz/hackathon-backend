require 'rails_helper'

require 'pry'

describe 'Sessions API Endpoint Specs', :type => :request do 
    fixtures :users
    fixtures :hackathons
    fixtures :hackathon_phases

    describe 'endpoint => api/users/sign_in' do
    
    it 'Should authenticate and sign in an user' do 
        post '/api/users/sign_in', params: {email: "miguel@miguel.com", password: "123456" }
        json_response = JSON.parse(response.body)
        expect(json_response["firstName"]).to eq("Miguel")
    end

    it 'Should reject a sign in request with wrong params' do 
        post '/api/users/sign_in', params: {email: "fake@fake.com", password: "123456"}
        json_response = JSON.parse(response.body)
        expect(json_response['errors']).not_to eq(nil)
    end

    describe 'endpoint => api/users/sign_up' do

        it 'Should create a new valid user' do 
            my_params = { name: "Minueto",email:"minueto@mmm.com", surname:"Lopez", password:"123456", position:"Chief of Nothingness", company:"Self Employed" }
            post '/api/users/', params: my_params
            expect(User.all.size).to  eq(2)
        end
    
        it 'Should reject a new user creation request if params are incomplete' do 
            my_params = {email:"minueto@mmm.com", surname:"Lopez", password:"123456", position:"Chief of Nothingness", company:"Self Employed" }
            post '/api/users/', params: my_params
            expect(User.all.size).to  eq(1)
         end
        end
    end
end