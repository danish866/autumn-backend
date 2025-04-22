class AddUserToChallanges < ActiveRecord::Migration[7.1]
  def change
    add_reference :challanges, :user, null: false, foreign_key: true
  end
end
