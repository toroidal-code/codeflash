json.array!(@comments) do |comment|
  json.extract! comment, :body, :up_votes, :down_votes, :profile_id, :commentable_id, :commentable_type, :created_at, :updated_at
  json.url comment_url(comment, format: :json)
end
