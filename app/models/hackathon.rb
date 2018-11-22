class Hackathon < ApplicationRecord
    has_many :hackathon_sessions
    has_many :users, through: :hackathon_sessions
    has_many :hackathon_phases
end
