class CreateHackathonSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :hackathon_sessions do |t|
      t.references :user
      t.references :hackathon
      t.timestamps
    end
  end
end
