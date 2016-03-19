json.array!(@bitotsav_organisers) do |bitotsav_organiser|
  json.extract! bitotsav_organiser, :id, :Name, :Role, :Rating, :Activity, :Team
  json.url bitotsav_organiser_url(bitotsav_organiser, format: :json)
end
