class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
     if user.has_role? :admin
        can :manage, :all
        #can :read, User
        ##can :read,Audit
        ##can :create,User do |u|
        #cannot :create,User
        #cannot :destroy,User

        ##can :destroy,User do |u|
          #    user==u
        #end
        #can :update,User
    end
     if user.has_role? :docenteInvestigador
        can :read, User 
        cannot :create, User
        cannot :read, Audit
     end        
  end
end

