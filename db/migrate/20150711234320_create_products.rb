class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name,  null:false
      t.text :description, null:false
      t.float :price, null:false
      t.string :image_url, null:false
      t.string :full_image_url, null:false

      t.timestamps null: false
    end
  end
end
