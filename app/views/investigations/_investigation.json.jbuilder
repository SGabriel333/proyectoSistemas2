json.extract! investigation, :id, :nombre, :descripcion, :fecha_entrega, :user_id, :created_at, :updated_at
json.url investigation_url(investigation, format: :json)
