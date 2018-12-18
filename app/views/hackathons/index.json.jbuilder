json.hackathons @hackathons  do |hackathon|
  json.title hackathon.title
  json.lead_hacker do 
    json.name hackathon.leader.name
    json.last_name hackathon.leader.surname
    json.position hackathon.leader.position
    json.avatar_pic hackathon.leader.avatar_pic
  end
  json.problem_statement  hackathon.hackathon_phases.where(type:"DefinePhase").first.problem_statement
  json.empathise_url hackathon.hackathon_phases.where(type:"EmpathisePhase").first.image_url
  json.ideate_url hackathon.hackathon_phases.where(type:"IdeatePhase").first.image_url
  json.prototype_url hackathon.hackathon_phases.where(type:"PrototypePhase").first.image_url
  json.test_protocol hackathon.hackathon_phases.where(type:"TestPhase").first.test_protocol
  json.test_timeframe hackathon.hackathon_phases.where(type:"TestPhase").first.test_timeframe
end