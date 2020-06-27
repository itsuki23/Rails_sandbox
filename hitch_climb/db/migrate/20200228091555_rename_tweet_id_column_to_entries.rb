class RenameTweetIdColumnToEntries < ActiveRecord::Migration[5.2]
  def change
    rename_column :entries, :tweet_id, :event_id

  end
end
