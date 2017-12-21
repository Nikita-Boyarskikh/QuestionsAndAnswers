json.extract! question, :id, :title, :text, :rating, :tag_id, :author_id, :created_at, :updated_at
json.url question_url(question, format: :json)
