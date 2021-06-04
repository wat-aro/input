class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :review, null: false, foreign_key: true
      t.string :path, null: false
      t.integer :position
      t.string :body, null: false
      t.integer :line
      t.string :side
      t.integer :start_line
      t.integer :start_side

      t.timestamps
    end
  end
end
