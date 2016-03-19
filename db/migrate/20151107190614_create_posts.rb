class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

        t.string :club
	t.string :title
	t.string :date
	t.string :timr
	t.text :image1
	t.text :image2
	t.text :image3
	t.text :video1
	t.text :video2
	t.text :file1
	t.text :file2
	t.text :file3
	t.text :shortdesc ,limit: 1000 
	t.text :longdesc
	t.string :category
	t.timestamps null: false
    end
  end
end
