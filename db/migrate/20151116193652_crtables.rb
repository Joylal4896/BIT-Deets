class Crtables < ActiveRecord::Migration
  def change
  
  	create_table :subscribe_sms do |s|

  		s.string :phone
  		s.string :club
  	end

  	create_table :subscribe_email do |t|

  		t.string :email
  		t.string :club
  	end

  end
end
