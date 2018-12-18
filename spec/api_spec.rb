require 'rails_helper'
require 'pry'

RSpec.describe 'api/hackathons', :type => :request do
    describe 'api/hackathons/index' do
        it 'should respond to the URL' do
            get '/api/hackathons/index'
            expect(response).not_to eq(nil)
        end

        it 'should show hackathons if user is authenticated' do
            get '/api/hackathons/index/', {Authentication: "m6-sxEmSAxGt6Ux7FGsN"}
            binding.pry
        end

        it 'should respond with an error if the user is not authenticated' do
           get '/api/hackathons/index'
           json = JSON.parse(response.body)
           expect(json['message']).to eq("token authentication error, please try logging in again.")
        end
    end
end