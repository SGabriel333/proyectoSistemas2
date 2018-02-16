json.extract! investigation, :id, :nombre, :descripcion, :fecha_inicio, :fecha_fin, :user_id, :created_at, :updated_at
json.url investigation_url(investigation, format: :json)
