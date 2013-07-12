json.array!(@solutions) do |solution|
  json.extract! solution, :code, :profile_id, :up_votes, :down_votes, :problem_id, :created_at, :updated_at, :language_id
  json.url solution_url(solution, format: :json)
end
