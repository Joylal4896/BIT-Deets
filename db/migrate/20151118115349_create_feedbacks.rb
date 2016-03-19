class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|

    	t.text :name,	null: false
    	t.text :rollno,	null: false
    	t.text :branch,	null: false
    	t.text :email,	null: false
    	t.text :phoneno	
    	t.text :feedback
    	t.text :putmore
    	t.text :contactvia

    t.timestamps null: false
    end
  end
end
