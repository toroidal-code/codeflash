class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 

    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can [:update, :create], Profile, user_id: user.id
      can [:create, :destroy], Solution
    end
  end
end
