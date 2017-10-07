class CreateDispatchings < ActiveRecord::Migration[5.0]
  def change
    create_table :dispatchings do |t|
      t.references :chem, foreign_key: true
      t.integer :dispatching_number
      t.string :dispatching_person

      t.timestamps
    end
  end
end
