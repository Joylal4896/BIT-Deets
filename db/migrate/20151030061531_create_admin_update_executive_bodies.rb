class CreateAdminUpdateExecutiveBodies < ActiveRecord::Migration
  def change
    create_table :admin_update_executive_bodies do |t|
      t.string :club
      t.string :name
      t.string :role
      t.string :role_first_char
      t.string :fb_link
      t.string :twitter_link
      t.string :contact

      t.timestamps null: false
    end
  end
end
