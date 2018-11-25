json.array! @users do |user|
    json.id user.id
    json.firstName user.name 
    json.lastName user.surname
    json.avatarPic user.avatar_pic
    json.position user.position
end