json.array!(@languages) do |language|
  json.extract! language, :name, :created_at, :updated_at, :ace_syntax, :pygments_syntax
  json.url language_url(language, format: :json)
end
