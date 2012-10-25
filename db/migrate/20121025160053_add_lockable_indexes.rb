class AddLockableIndexes < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      add_index :users, :unlock_token,   :unique => true
    end
  end
end
