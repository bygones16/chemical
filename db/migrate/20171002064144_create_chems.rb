class CreateChems < ActiveRecord::Migration[5.0]
  def change
    create_table :chems do |t|
      t.string :chemical_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
