class CreateChallanges < ActiveRecord::Migration[7.1]
  def change
    create_table :challanges do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end
  end
end
