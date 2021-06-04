class CreatePullRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :pull_requests do |t|
      t.references :repository, null: false, foreign_key: true
      t.bigint :number, null: false

      t.timestamps

      t.index [:repository_id, :number], unique: true
    end
  end
end
