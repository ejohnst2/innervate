class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.array :category
      t.string :stage
      t.string :channel
      t.json :endorsements
      t.json :insights

      t.timestamps
    end
  end
end
