class Delete < ActiveRecord::Migration
  def change
	
	remove_column :posts, :date
	remove_column :posts, :timr 

  end
end
