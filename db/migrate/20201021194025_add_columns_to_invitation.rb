class AddColumnsToInvitation < ActiveRecord::Migration[6.0]
  def change
    remove_column :invitations, :accepted, :boolean
    add_column :invitations, :attendee_id, :integer
    add_column :invitations, :attended_event_id, :integer
  end
end