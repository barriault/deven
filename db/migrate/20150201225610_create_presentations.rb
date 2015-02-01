class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.belongs_to :activity, index: true
      t.datetime :event_date
      t.integer :rn_participants
      t.integer :all_participants

      t.timestamps null: false
    end
  end
end
