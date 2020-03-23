class RenameUsersToConsumers < ActiveRecord::Migration[6.0]
  def change
    rename_table :users, :consumers
  end
end
