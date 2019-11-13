class CreateEventAuthorings < ActiveRecord::Migration[6.0]
  def change
    create_table :event_authorings do |t|
      t.integer :attendent_event_id
      t.integer :event_attendee_id

      t.timestamps
    end
  end
end
