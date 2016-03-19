json.array!(@admin_update_executive_bodies) do |admin_update_executive_body|
  json.extract! admin_update_executive_body, :id, :club, :name, :role, :role_first_char, :fb_link, :twitter_link, :contact
  json.url admin_update_executive_body_url(admin_update_executive_body, format: :json)
end
