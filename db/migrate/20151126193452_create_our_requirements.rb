class CreateOurRequirements < ActiveRecord::Migration
  def change
    create_table :our_requirements do |t|
	
	t.string :club
	t.string :requirements
	t.text :file
      t.timestamps null: false
    end
  end
end
