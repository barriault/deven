class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string   :title
      t.datetime :start_date
      t.datetime :end_date
      t.string   :activity_type
      t.decimal  :contact_hours
      t.boolean  :co_provided
      t.boolean  :received_support
      t.monetize :commercial_support, amount: { null: true, default: nil }
      t.monetize :sponsorship, amount: { null: true, default: nil }

      t.timestamps null: false
    end
  end
end
