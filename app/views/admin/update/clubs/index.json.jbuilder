json.array!(@admin_update_clubs) do |admin_update_club|
  json.extract! admin_update_club, :id, :shortname,  :clubname, :clubdesc, :clubweblink, :videolink, :clubquote, :imagelink
  json.url admin_update_club_url(admin_update_club, format: :json)
end

