
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

        it 'should create a new notification and attach it to a hackathon' do
            post '/api/notifications', params: {hackathon_id: 1}
            expect(Notification.all.size).to eq(3)
        end

        it 'should not create a new notification without a valid hackathon id' do
            post '/api/notifications', params: {hackathon_id: "ID wololo"}
            expect(Notification.all.size).to eq(2)
        end

    # At this point the notifications feature is experimental, it's ok to not
    # have auth'd requests for deletion

    describe 'endpoint => /api/remove_notifications' do
        it 'should delete all notifications' do
            get '/api/remove_notifications'
            expect(Notification.all.size).to eq(0)
        end
    
    
    end
  end
end