json.extract! account, :id, :first_name, :last_name, :phone, :location, :about, :role, :linkedin, :created_at, :updated_at
json.url account_url(account, format: :json)
