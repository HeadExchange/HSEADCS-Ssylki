require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  test "user should not create board without title" do
    user = users(:user)
    board = user.boards.create()

    assert_not board.persisted?
  end

  test "user should create board" do
    user = users(:user)
    board = user.boards.create(title: 'Test')

    assert board.persisted?
  end

  test "user should not update board without title" do
  end

  test "user should update board" do
  end

  test "user should not destroy board he not own" do
    collaborator = users(:collaborator)
    ability = Ability.new(collaborator)
    board = boards(:collaborative)

    assert ability.cannot?(:destroy, board)
  end

  test "user should destroy board" do
    user = users(:user)
    ability = Ability.new(user)
    private_board = boards(:private)
    collaborative_board = boards(:collaborative)
    will_be_collaborative = boards(:will_be_collaborative)

    assert ability.can?(:destroy, private_board)
    assert ability.can?(:destroy, collaborative_board)
    assert ability.can?(:destroy, will_be_collaborative)

    private_board.destroy
    collaborative_board.destroy
    will_be_collaborative.destroy

    assert_not private_board.persisted?
    assert_not collaborative_board.persisted?
    assert_not will_be_collaborative.persisted?
  end
end
