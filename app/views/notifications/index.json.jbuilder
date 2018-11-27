json.notifications @notifications.order(:created_at) do |notification|
    json.created_at notification.created_at.to_s
    json.user do
        json.name notification.hackathon.leader.name
        json.surname notification.hackathon.leader.surname
        json.position notification.hackathon.leader.position
        json.avatar_pic notification.hackathon.leader.avatar_pic
    end
end