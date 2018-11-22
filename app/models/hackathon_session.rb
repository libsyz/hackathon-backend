class HackathonSession < ApplicationRecord
    belongs_to :user
    belongs_to :hackathon
end
