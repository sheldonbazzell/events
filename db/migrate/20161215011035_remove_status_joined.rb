class RemoveStatusJoined < ActiveRecord::Migration
  def change
  	remove_column :statuses, :joined, :boolean
  end
end
