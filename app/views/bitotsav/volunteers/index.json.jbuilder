json.array!(@bitotsav_volunteers) do |bitotsav_volunteer|
  json.extract! bitotsav_volunteer, :id, :Name, :Role, :Rating, :Activity, :Team
  json.url bitotsav_volunteer_url(bitotsav_volunteer, format: :json)
end
