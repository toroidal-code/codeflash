json.array!(@achievements) do |achievement|
  json.extract! achievement, :name, :description, :points, :created_at, :updated_at
  json.url achievement_url(achievement, format: :json)
end
