class AddNameAndCustomStatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :custom_status, :string
  end
end
