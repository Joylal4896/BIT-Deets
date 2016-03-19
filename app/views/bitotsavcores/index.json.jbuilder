json.array!(@bitotsavcores) do |bitotsavcore|
  json.extract! bitotsavcore, :id, :name, :email, :contact, :fblink
  json.url bitotsavcore_url(bitotsavcore, format: :json)
end
