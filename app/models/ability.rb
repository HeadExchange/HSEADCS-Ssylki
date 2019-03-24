class Ability
  include CanCan::Ability

  def initialize(user)
    can :show, Board, public: true
    can :read, Link, board: { public: true }

    if user.present?
      can :manage, Board, user_id: user.id
      can :manage, Link, user_id: user.id

      if user.admin?
        can :manage, :all
      end

    end

  end

end
