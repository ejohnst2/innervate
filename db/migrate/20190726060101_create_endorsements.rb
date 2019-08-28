class CreateEndorsements < ActiveRecord::Migration[5.2]
  def change
    create_table :endorsements do |t|
      t.references :user, foreign_key: true
      t.references :idea, foreign_key: true
    end
  end
end
