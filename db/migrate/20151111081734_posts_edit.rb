class PostsEdit < ActiveRecord::Migration
  def change
	
	add_column :posts , :venue , :text
  end
end
