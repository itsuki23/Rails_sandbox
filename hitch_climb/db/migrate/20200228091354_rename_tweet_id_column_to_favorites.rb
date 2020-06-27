class RenameTweetIdColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :tweet_id, :event_id
  end
end
