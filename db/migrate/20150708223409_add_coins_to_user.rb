class AddCoinsToUser < ActiveRecord::Migration
  def change
    add_column :users, :coins, :integer
  end
end
