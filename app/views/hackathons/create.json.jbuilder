    json.hackathon_id @hackathon.id
    json.phases @hackathon.hackathon_phases.order(:phase_number) do |phase|
        json.phaseOrder phase.phase_number
        json.completed phase.completed
        json.phaseId phase.id
        json.type phase.type
        json.headerText phase.header_text
        
end