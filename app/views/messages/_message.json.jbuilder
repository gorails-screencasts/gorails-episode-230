json.extract! message, :id, :user_id, :title, :body, :state, :job_id, :created_at, :updated_at
json.url message_url(message, format: :json)
