class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :plan
      t.string :name
      t.string :slack_id

      t.timestamps
    end
  end
end
