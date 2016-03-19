class CreateBitotsavVolunteers < ActiveRecord::Migration
  def change
    create_table :bitotsav_volunteers do |t|
      t.string :Name
      t.string :Role
      t.integer :Rating
      t.boolean :Activity
      t.string :Team

      t.timestamps null: false
    end
  end
end
