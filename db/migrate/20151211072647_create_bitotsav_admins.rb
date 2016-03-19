class CreateBitotsavAdmins < ActiveRecord::Migration
  def change
    create_table :bitotsav_admins do |t|

       t.string :username
       t.string :password_digest

      t.timestamps null: false
    end
  end
end
