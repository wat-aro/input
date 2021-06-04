class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :pull_request, null: false, foreign_key: true
      t.string :commit_id, null: false
      t.string :body
      t.string :event, null: false

      t.timestamps
    end
  end
end
