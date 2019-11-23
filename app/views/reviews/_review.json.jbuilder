json.extract! review, :id, :menu, :comment, :image, :created_at, :updated_at
json.url review_url(review, format: :json)
