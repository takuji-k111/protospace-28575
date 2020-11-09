class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :title, null: false, defaulte: ""
      t.text :catch_copy, null: false
      t.string :concept, null: false, defaulte: ""
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
