# Determines permissions for normal users, admin users, and users who aren't
# signed in. Used by CanCan.
class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, :all
    elsif user.admin?
      can :manage, :all
    else
      can :read, :all
      can :update, Profile, :user_id => user.id
      can :create, [Profile, Solution, ProblemComment, SolutionComment]
      can [:destroy, :update, :edit],  Solution, profile_id: user.profile.id
    end
  end
end
