class Alter < ActiveRecord::Migration
  def change

	add_column :posts, :image1, :string
  end
end
