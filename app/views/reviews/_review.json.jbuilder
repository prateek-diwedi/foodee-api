json.extract! review, :id, :user_id, :res_id, :review_text, :created_at, :updated_at
json.url review_url(review, format: :json)
