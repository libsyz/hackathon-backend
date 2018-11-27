class AvatarFactory
    def self.generate_avatar
        avatar_array = ["avatar_pic_1.png", "avatar_pic_2.png", "avatar_pic_3.png", "avatar_pic_4.png", "avatar_pic_5.png", "avatar_pic_6.png"]
        avatar_array.sample
    end
end