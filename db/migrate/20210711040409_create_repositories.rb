class CreateRepositories < ActiveRecord::Migration[6.1]
  def change
    create_table :repositories do |t|
      t.string :name, null: false
      t.references :owner, polymorphic: true, null: false

      t.timestamps
      t.index :name, unique: true
    end
  end
end
