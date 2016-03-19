class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :mail
      t.string :name
      t.string :mailhash

      t.timestamps null: false
    end
  end
end
