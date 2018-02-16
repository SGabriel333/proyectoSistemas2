class Investigation < ApplicationRecord
  belongs_to :user
  has_many :attacheds
  audited 
def current_user
  User.find_by_username 'root'
end

  def self.current
  Thread.current[:user]
end
def self.current=(user)
  Thread.current[:user]=user
end
end
