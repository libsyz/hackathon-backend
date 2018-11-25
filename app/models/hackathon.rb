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
        problem_statement = HackathonPhase.create(type:"DefinePhase", phase_number: 1) 
        empathise = HackathonPhase.create(type:"EmpathisePhase", phase_number: 2)
        ideate = HackathonPhase.create(type:"IdeatePhase", phase_number: 3)
        prototype = HackathonPhase.create(type:"PrototypePhase", phase_number: 4)
        test_protocol = HackathonPhase.create(type:"TestPhase", phase_number: 5)
        hackathon_phases << problem_statement << empathise << ideate << prototype << test_protocol
        save
    end
end
