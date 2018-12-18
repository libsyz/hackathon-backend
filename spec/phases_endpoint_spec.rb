require 'rails_helper'


describe 'Phases Modifications Endpoints', type: :request do
  fixtures :users
  fixtures :hackathons
  describe "endpoints => /api/hackathon_phases/edit_phase" do
    
    
    it("Should add a problem statement to a phase") do
      Hackathon.find(1).generate_phases

      patch '/api/hackathon_phases/edit_phase', 
            params: {hackathon_id: 1, phase_number: 1, edit_problem_statement: "A new problem Statement"}, 
            headers: {Authentication: users(:miguel).authentication_token}

      problem_statement = Hackathon.find(1).hackathon_phases.where(type:"DefinePhase").first.problem_statement
      expect(problem_statement).to eq("A new problem Statement")
      # expect a phase to contain a problem statement
    end

    it("Should add an image url to a phase via authenticated request") do
      Hackathon.find(1).generate_phases

      patch '/api/hackathon_phases/edit_phase', 
            params: {hackathon_id: 1, phase_number: 2, edit_image_url: "somepic.url"}, 
            headers: {Authentication: users(:miguel).authentication_token}

      image_url = Hackathon.find(1).hackathon_phases.where(type:"EmpathisePhase").first.image_url
      expect(image_url).to eq("somepic.url")
    end

    it("Should add an test protocol and a test timeframe to a phase") do
      Hackathon.find(1).generate_phases
      patch '/api/hackathon_phases/edit_phase', 
            params: {hackathon_id: 1, phase_number: 5, edit_test_protocol: ['action one','action two'], edit_test_timeframe:"2 Weeks" },
            headers: {Authentication: users(:miguel).authentication_token}

      test_protocol = Hackathon.find(1).hackathon_phases.where(type:"TestPhase").first.test_protocol
      test_timeframe = Hackathon.find(1).hackathon_phases.where(type:"TestPhase").first.test_timeframe

      expect(test_protocol).to eq(["action one", 'action two'])
      expect(test_timeframe).to eq("2 Weeks")  
    end
    
  end
  

end
