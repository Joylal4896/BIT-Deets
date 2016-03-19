class CreateBitotsavOrganisers < ActiveRecord::Migration
  def change
    create_table :bitotsav_organisers do |t|
      t.string :Name
      t.string :Role
      t.integer :Rating
      t.boolean :Activity
      t.string :Team

      t.timestamps null: false
    end
  end
end
