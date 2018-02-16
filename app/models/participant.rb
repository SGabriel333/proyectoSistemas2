class Participant < ApplicationRecord
  belongs_to :student
  belongs_to :extension
end
