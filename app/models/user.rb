class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  audited
 
 def current_user
  User.find_by_username 'root'
end

 def is_admin?
    self.has_role?(:admin)
 end

 def is_adminExt?
    self.has_role?(:adminExt)
 end

 def is_adminInv?
    self.has_role?(:adminInv)
 end

 def is_investigador?
    self.has_role?(:Investigador)
 end


end
