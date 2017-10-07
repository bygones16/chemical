class CreateEnterings < ActiveRecord::Migration[5.0]
  def change
    create_table :enterings do |t|
      t.references :chem, foreign_key: true
      t.integer :entering_number
      t.string :entering_person

      t.timestamps
    end
  end
end
