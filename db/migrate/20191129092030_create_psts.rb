class CreatePsts < ActiveRecord::Migration[5.2]
  def change
    create_table :psts do |t|
      t.string :image

      t.timestamps
    end
  end
end
