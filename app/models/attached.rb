class Attached < ApplicationRecord
  belongs_to :investigation
  belongs_to :investigation

  #Url por defecto para un archivo adjunto.
  #Validacion de los tipos de archivos que soporta un adjunto.
  has_attached_file :file, default_url: "/files/:style/missing.png"
  validates_attachment :file, content_type: { content_type: ["application/vnd.openxmlformats-officedocument.wordprocessingml.document",
  												"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"] }
end
