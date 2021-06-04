class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false

      t.timestamps
      t.index :name, unique: true
    end
  end
end
