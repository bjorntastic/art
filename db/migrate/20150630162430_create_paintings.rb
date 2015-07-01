class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :genre
      t.string :painter

      t.timestamps null: false
    end
  end
end
