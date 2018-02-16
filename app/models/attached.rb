class Attached < ApplicationRecord
  before_save :default_values
  def default_values
  	self.fecha_subida ||= Date.today.to_s #Obtiene la fecha del sistema y guarda en el atributo por defecto.
  end
  belongs_to :investigation
  has_attached_file :file, default_url: "/files/:style/missing.png"
  validates_attachment :file, content_type: { content_type: ["application/vnd.openxmlformats-officedocument.wordprocessingml.document",
  												"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"] }

end
