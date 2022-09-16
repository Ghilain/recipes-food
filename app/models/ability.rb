class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :manage, Food, user_id: user.id
      can :manage, Recipe, user_id: user.id
      can :destroy, Food do |food|
        food.user_id == user.id
      end
      can :destroy, Recipe do |recipe|
        recipe.user_id == user.id
      end
    end
    
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
