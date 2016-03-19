class CreateApproves < ActiveRecord::Migration
  def change
    create_table :approves do |t|
      t.string :post_id
      t.boolean :app1
      t.boolean :app2
      t.boolean :app3
      t.string :app_comment1
      t.string :app_comment2
      t.string :app_comment3

      t.timestamps null: false
    end
  end
end
