class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
