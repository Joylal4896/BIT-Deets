class AddPasswordDigestToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :password_digest, :string
  end
end
