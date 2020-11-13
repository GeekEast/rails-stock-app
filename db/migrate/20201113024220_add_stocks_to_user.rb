class AddStocksToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :stocks, :user, index: true, foreign_key: true
  end
end
