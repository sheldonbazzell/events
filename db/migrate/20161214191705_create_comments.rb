class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :event, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
