json.extract! article, :id, :title, :description, :when_went, :created_at, :updated_at
json.url article_url(article, format: :json)
