class CreateHackathonPhases < ActiveRecord::Migration[5.0]
  def change
    create_table :hackathon_phases do |t|
      t.string     :type,         null: false
      t.string     :problem_statement 
      t.string     :test_protocol
      t.string     :test_timeframe
      t.text       :image_url
      t.boolean    :completed
      t.references :hackathon
      t.timestamps
    end
  end
end
