class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Board, published: true
    can :read, Link, board: { published: true }

    if user.present?
      can :manage, Board, user_id: user.id
      can :manage, Link, user_id: user.id

      can :read, Board, Board.all do |board|
        collaborator_ids = board.collaborations.collect { |c| c.user_id }
        collaborator_ids.include?(user.id)
      end

      if user.admin?
        can :manage, :all
      end

    end

  end

end
