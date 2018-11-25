class Hackathon < ApplicationRecord
    has_many :hackathon_sessions
    has_many :users, through: :hackathon_sessions
    has_many :hackathon_phases
    
    def add_user(hacker)

      if users.include?(hacker)
       return StandardError
      else
        users << hacker
      end
    end
end
