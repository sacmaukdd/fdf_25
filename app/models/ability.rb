class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
      cannot :update, User
    else
      can :read, :all
    end
  end
end
