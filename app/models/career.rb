class Career < ApplicationRecord
	has_many :students
	has_many :extensions
	audited
end
