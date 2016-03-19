class Newmig < ActiveRecord::Migration
 

	def self.up
    add_attachment :posts, :image
  end

  def self.down
    remove_attachment :friends, :image
  end


end
