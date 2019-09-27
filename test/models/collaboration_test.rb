require 'test_helper'

class CollaborationTest < ActiveSupport::TestCase
  test "collaborator for the board should be created" do
    user = users(:user)
    collaborator = users(:collaborator)
    board = boards(:will_be_collaborative)
    collaboration = board.collaborations.create(user_id: collaborator.id)

    assert collaboration.persisted?
  end
end
