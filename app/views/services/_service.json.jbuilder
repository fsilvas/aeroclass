json.extract! service, :id, :client_id, :begin_address, :begin_comuna, :end_address, :end_comuna, :hour, :service_date, :driver, :n_passenger, :n_bag, :flight, :pay_type, :status, :comment, :price, :created_at, :updated_at
json.url service_url(service, format: :json)
