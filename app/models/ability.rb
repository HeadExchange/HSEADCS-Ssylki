class Ability
  include CanCan::Ability

  def initialize(user)
    # can :read, Board, public: true
    # can :read, Link, board: { public: true }
    can :read, :all

    # Public access for everyone (non-users too)
    # if board.public
    #   can :read, :all
    # end

    if user.present?
      can :manage, Board, user_id: user.id
      can :manage, Link, user_id: user.id

      if user.admin?
        can :manage, :all
      end
    end
  end

end
