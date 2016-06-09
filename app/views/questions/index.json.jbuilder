json.array!(@questions) do |question|
  json.extract! question, :id, :body, :answer
  json.url question_url(question, format: :json)
end
