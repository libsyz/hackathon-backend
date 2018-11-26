class AddPhaseNumberToPhases < ActiveRecord::Migration[5.0]
  def change
    add_column :hackathon_phases, :phase_number, :integer
  end
end
