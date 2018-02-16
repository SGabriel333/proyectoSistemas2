class Student < ApplicationRecord
  belongs_to :career
  audited
end
