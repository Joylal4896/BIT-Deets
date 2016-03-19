class Naya < ActiveRecord::Migration
  def change

  	add_column :bitotsav_volunteers , :club , :string 
  	add_column :bitotsav_organisers , :club , :string 

  end
end
