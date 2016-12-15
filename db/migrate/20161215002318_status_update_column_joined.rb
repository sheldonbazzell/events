class StatusUpdateColumnJoined < ActiveRecord::Migration
  def change
  	change_column_default :statuses, :joined, to: false 
  end
end
