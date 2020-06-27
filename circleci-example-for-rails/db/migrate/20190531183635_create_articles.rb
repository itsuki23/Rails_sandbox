class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.integer :post_status, null: false, default: 0
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
