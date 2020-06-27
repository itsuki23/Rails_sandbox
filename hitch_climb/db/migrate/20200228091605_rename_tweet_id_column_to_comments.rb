class RenameTweetIdColumnToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :tweet_id, :event_id

  end
end
