json.array!(@problems) do |problem|
  json.extract! problem, :name, :description, :points, :created_at, :updated_at, :profile_id, :shortname
  json.url problem_url(problem, format: :json)
end
