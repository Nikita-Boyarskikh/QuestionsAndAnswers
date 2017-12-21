json.extract! answer, :id, :text, :rating, :is_best, :question_id, :created_at, :updated_at
json.url answer_url(answer, format: :json)
