json.array!(@emails) do |email|
  json.extract! email, :id, :mail, :name, :club :password_digest
  json.url email_url(email, format: :json)
end
