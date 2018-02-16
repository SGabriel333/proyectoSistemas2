class Audit < ApplicationRecord
belongs_to :user
belongs_to :investigation
end