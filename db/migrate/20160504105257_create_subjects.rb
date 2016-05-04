class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title
      t.string :colour
      t.integer :unique_id
      t.references :qualification, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
