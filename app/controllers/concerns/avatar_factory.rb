class AvatarFactory
    def self.generate_avatar
        avatar_array = [
                        "https://res.cloudinary.com/dhodayze1/image/upload/v1543321728/hackathon_avatar_pics/avatar_pic_1.png",
                        "https://res.cloudinary.com/dhodayze1/image/upload/v1543321728/hackathon_avatar_pics/avatar_pic_2.png", 
                        "https://res.cloudinary.com/dhodayze1/image/upload/v1543321728/hackathon_avatar_pics/avatar_pic_3.png", 
                        "https://res.cloudinary.com/dhodayze1/image/upload/v1543321728/hackathon_avatar_pics/avatar_pic_4.png", 
                        "https://res.cloudinary.com/dhodayze1/image/upload/v1543321728/hackathon_avatar_pics/avatar_pic_5.png", 
                        "https://res.cloudinary.com/dhodayze1/image/upload/v1543321728/hackathon_avatar_pics/avatar_pic_6.png"
                        ]
        
        avatar_array.sample
    end
end