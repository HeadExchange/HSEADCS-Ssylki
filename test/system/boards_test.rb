require "application_system_test_case"

class BoardsTest < ApplicationSystemTestCase
  setup do
    @board = boards(:one)
  end

  test "visiting the index" do
    visit boards_url
    assert_selector "h1", text: "Boards"
  end

  test "creating a Board" do
    visit boards_url
    click_on "New Board"

    fill_in "Description", with: @board.description
    fill_in "Private", with: @board.private
    fill_in "Share Url", with: @board.share_url
    fill_in "Title", with: @board.title
    fill_in "Used", with: @board.used_id
    click_on "Create Board"

    assert_text "Board was successfully created"
    click_on "Back"
  end

  test "updating a Board" do
    visit boards_url
    click_on "Edit", match: :first

    fill_in "Description", with: @board.description
    fill_in "Private", with: @board.private
    fill_in "Share Url", with: @board.share_url
    fill_in "Title", with: @board.title
    fill_in "Used", with: @board.used_id
    click_on "Update Board"

    assert_text "Board was successfully updated"
    click_on "Back"
  end

  test "destroying a Board" do
    visit boards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Board was successfully destroyed"
  end
end
