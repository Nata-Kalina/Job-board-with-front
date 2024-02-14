json.extract! application, :id, :resume, :cover_letter, :status, :notes, :created_at, :updated_at
json.url application_url(application, format: :json)
