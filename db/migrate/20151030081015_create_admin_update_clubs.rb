class CreateAdminUpdateClubs < ActiveRecord::Migration
  def change
    create_table :admin_update_clubs do |t|
      t.string :clubname
      t.text :clubdesc
      t.text :clubweblink
      t.text :videolink
      t.text :clubquote

      t.timestamps null: false
    end
  end
end
