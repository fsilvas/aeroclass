json.extract! client, :id, :name, :last_name, :address, :comuna, :phone, :created_at, :updated_at
json.url client_url(client, format: :json)
