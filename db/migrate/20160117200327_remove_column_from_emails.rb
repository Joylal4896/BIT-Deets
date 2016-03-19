class RemoveColumnFromEmails < ActiveRecord::Migration
  def change
    remove_column :emails, :mailhash, :string
  end
end
