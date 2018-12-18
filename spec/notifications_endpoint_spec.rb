
describe 'Notifications API Endpoint Specs', :type => :request do
    fixtures :notifications
    fixtures :hackathons
    fixtures :users

    describe 'endpoint => api/notifications' do
        it 'should list all notifications' do

            Hackathon.all.each do |hackathon|
                hackathon.users << User.first 
                hackathon.save
            end



            Notification.all.each do |notification|
                notification.hackathon = Hackathon.first
                notification.save
            end

            

            get '/api/notifications', params: { hackathon_id: 1 }
            expect(response.body).not_to eq(nil)
        end

        # it 'should create a new notification' do
        # end

        # it 'should delete all notifications' do

        # end
    end
end