class Investigation < ApplicationRecord
  belongs_to :user
  has_many :attacheds
end
