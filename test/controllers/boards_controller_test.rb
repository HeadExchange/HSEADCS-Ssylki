require 'test_helper'

class BoardsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:collaborator)
    post user_session_url
  end

  test "collaborator should have access to collaborative user board" do
    collaborative_board = boards(:collaborative)
    get board_url(collaborative_board)

    assert_response :success
  end

  test "collaborator shouldn't have access to collaborative user board" do
    private_board = boards(:private)
    get board_url(private_board)

    assert_response :found
  end

  # setup do
  #   @board = boards(:one)
  # end
  #
  # test "should get index" do
  #   get boards_url
  #   assert_response :success
  # end
  #
  # test "should get new" do
  #   get new_board_url
  #   assert_response :success
  # end
  #
  # test "should create board" do
  #   assert_difference('Board.count') do
  #     post boards_url, params: { board: { description: @board.description, private: @board.private, share_url: @board.share_url, title: @board.title, user_id: @board.user_id } }
  #   end
  #
  #   assert_redirected_to board_url(Board.last)
  # end
  #
  # test "should show board" do
  #   get board_url(@board)
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get edit_board_url(@board)
  #   assert_response :success
  # end
  #
  # test "should update board" do
  #   patch board_url(@board), params: { board: { description: @board.description, private: @board.private, share_url: @board.share_url, title: @board.title, user_id: @board.user_id } }
  #   assert_redirected_to board_url(@board)
  # end
  #
  # test "should destroy board" do
  #   assert_difference('Board.count', -1) do
  #     delete board_url(@board)
  #   end
  #
  #   assert_redirected_to boards_url
  # end
end
