class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.references :user
      t.float :latitude
      t.float :longitude
      t.string :location_name
      t.string :location_img_url
      t.string :profile_pic_url
      t.string :profile_username
      t.string :user_adventure_pic_url
      t.text :biggest_challenge
      t.text :favorite_part
      t.boolean :completed

      t.timestamps null: false
    end
    add_index :adventures, :user_id
  end
end
