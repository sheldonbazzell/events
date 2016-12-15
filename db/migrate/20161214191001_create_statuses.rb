class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.references :user, index: true
      t.references :event, index: true
      t.boolean :joined

      t.timestamps
    end
  end
end
