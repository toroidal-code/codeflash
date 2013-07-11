json.array!(@profiles) do |profile|
  json.extract! profile, :name, :about_me, :github, :user_id, :created_at, :updated_at, :language_id
  json.url profile_url(profile, format: :json)
end
