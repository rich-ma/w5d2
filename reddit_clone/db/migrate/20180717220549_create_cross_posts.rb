class CreateCrossPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :cross_posts do |t|
      t.integer :sub_id
      t.integer :post_id
    end
  end
end
