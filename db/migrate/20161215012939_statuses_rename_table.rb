class StatusesRenameTable < ActiveRecord::Migration
  def change
  	rename_table :statuses, :join
  end
end
