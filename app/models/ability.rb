class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, :all
    elsif user.admin?
      can :manage, :all
    else
      can :read, :all
      can [:update, :create], Profile, user_id: user.id
      can :create, Solution
      can :destroy, Solution, user_id: user.id
    end
  end
end
