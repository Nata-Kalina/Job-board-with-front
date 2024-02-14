json.extract! job, :id, :title, :description, :location, :categoty, :remote, :salary, :requirements, :responsibilities, :application_deadline, :created_at, :updated_at
json.url job_url(job, format: :json)
