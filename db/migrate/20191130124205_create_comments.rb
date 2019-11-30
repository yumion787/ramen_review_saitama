class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :menu
      t.text :body
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
