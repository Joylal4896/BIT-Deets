class AddColumnToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :confirmation, :string
  end
end
