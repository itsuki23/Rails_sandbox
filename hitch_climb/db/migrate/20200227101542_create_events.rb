class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :head
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
