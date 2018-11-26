class HackathonPhase < ApplicationRecord
    belongs_to :hackathon
    serialize :test_protocol

    def update(params)
        params.keys.each do |key|
         if key.include?("edit_")
            phase_attribute = key.gsub("edit_", "")
            self[phase_attribute] = params[key]
            self.completed = true
        end
      end
    end
end
