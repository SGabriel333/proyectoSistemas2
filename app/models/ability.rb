class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
     if user.has_role? :admin
        can :read, User
        can :create,User
        #cannot :create,User
        #cannot :destroy,User

        can :destroy,User do |u|
              user==u
        end
    end
     if user.has_role? :AdminDptoExt
        can :read, User
        cannot :destroy,user
    end
  end
end
