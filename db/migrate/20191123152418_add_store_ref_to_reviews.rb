class AddStoreRefToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :store, foreign_key: true
  end
end
