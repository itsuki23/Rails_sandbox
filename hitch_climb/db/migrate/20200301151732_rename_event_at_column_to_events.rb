class RenameEventAtColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :event_at, :start_time
  end
end
