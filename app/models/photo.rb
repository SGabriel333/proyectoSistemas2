class Photo < ApplicationRecord
  belongs_to :extension

	has_attached_file :img, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/

  	def extension_name
		self.extension.blank? ? "" : self.extension.name
	end

end
