class NowA < ActiveRecord::Migration
  def change
  end

 def self.up
    add_attachment :posts, :image
  end
end
