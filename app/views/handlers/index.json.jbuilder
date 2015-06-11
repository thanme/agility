json.array!(@handlers) do |handler|
  json.extract! handler, :id, :first_name, :last_name, :reg, :email
  json.url handler_url(handler, format: :json)
end
