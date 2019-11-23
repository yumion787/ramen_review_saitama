class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.text :infomation
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
