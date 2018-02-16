class Document < ApplicationRecord
belongs_to :extension
has_attached_file :doc, default_url: "/files/:style/missing.png"
  validates_attachment :doc, content_type: { content_type: ["application/vnd.openxmlformats-officedocument.wordprocessingml.document",
  												"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"] }

end
