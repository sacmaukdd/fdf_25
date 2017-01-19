class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
      cannot :update, User
    else
      can :read, :all
      can :create, Comment
      can :update, Comment
      can :destroy, Comment
      can :create, Order
      can :destroy, Order
    end
  end
end
