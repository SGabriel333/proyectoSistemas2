class Extension < ApplicationRecord
  belongs_to :state
  belongs_to :manager
  belongs_to :extension_type
  has_many :participants
	def state_name
		self.state.blank? ? "" : self.state.name
	end

	def manager_name
		self.manager.blank? ? "" : self.manager.name
	end
end
