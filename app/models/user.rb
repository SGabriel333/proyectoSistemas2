class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :investigations
  before_create { generate_token(:auth_token) }
  audited
 
 def is_admin?
    self.has_role?(:admin)
 end

 def is_adminExt?
    self.has_role?(:adminExtension)
 end

 def is_adminInv?
    self.has_role?(:adminInvestigacion)
 end

 def is_investigador?
    self.has_role?(:docenteInvestigador)
 end
     def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end


  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
end
