json.extract! todo, :id, :user_id, :title, :description, :due_date, :status, :google_event_id, :reminder_sent, :created_at, :updated_at
json.url todo_url(todo, format: :json)
