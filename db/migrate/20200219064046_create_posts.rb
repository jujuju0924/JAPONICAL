class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.string :text
      t.string :address, null: false
      t.string :image,  null: false
      t.float  :latitude
      t.float  :longitude
      t.timestamps
      t.references :user
    end
  end
end
