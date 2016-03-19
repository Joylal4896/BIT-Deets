class CreateBitotsavcores < ActiveRecord::Migration
  def change
    create_table :bitotsavcores do |t|
      t.string :name
      t.string :email
      t.string :contact
      t.string :fblink

      t.timestamps null: false
    end
  end
end
