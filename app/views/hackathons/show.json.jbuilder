json.hackathon do
    json.hackers_enlisted @hackathon.users.size
    json.phases @hackathon.hackathon_phases
end