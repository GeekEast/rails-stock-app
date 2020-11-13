class RemoveUsersFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :user, index: true, foreign_key: true
  end
end
