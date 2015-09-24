class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :image_url
      t.string :bio
      t.string :name
      t.string :nickname
      t.string :website
      t.string :uid
      t.string :token
      t.string :provider

      t.timestamps null: false
    end
  end
end
