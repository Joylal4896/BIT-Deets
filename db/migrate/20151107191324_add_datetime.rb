class AddDatetime < ActiveRecord::Migration
  def change
 
  add_column :posts , :eventdatetime, :datetime 

  end
end
