class Hackathon < ApplicationRecord
    has_many :hackathon_sessions
    has_many :users, through: :hackathon_sessions
    has_many :hackathon_phases, dependent: :destroy
    
    def add_user(hacker)
      if users.include?(hacker)
       return StandardError
      else
        users << hacker
      end
    end

    def generate_phases
        problem_statement = HackathonPhase.create(type:"DefinePhase") 
        empathise = HackathonPhase.create(type:"EmpathisePhase")
        ideate = HackathonPhase.create(type:"IdeatePhase")
        prototype = HackathonPhase.create(type:"PrototypePhase")
        test_protocol = HackathonPhase.create(type:"TestPhase")
        hackathon_phases << problem_statement << empathise << ideate << prototype << test_protocol
        save
    end
end
