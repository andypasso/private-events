class ChangeAttendentEventIdToAttendedEventId < ActiveRecord::Migration[6.0]
  def change
    rename_column :event_authorings, :attendent_event_id, :attended_event_id
  end
end