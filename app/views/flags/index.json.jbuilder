json.array!(@flags) do |flag|
  json.extract! flag, :profile_id, :reason, :explanation, :flaggable_id, :flaggable_type, :created_at, :updated_at
  json.url flag_url(flag, format: :json)
end
