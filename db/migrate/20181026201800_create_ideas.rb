class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.string :category
      t.string :stage
      t.string :channel
      t.references :idea, foreign_key: true

      t.timestamps
    end
  end
end
