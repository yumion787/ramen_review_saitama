require "application_system_test_case"

class PstsTest < ApplicationSystemTestCase
  setup do
    @pst = psts(:one)
  end

  test "visiting the index" do
    visit psts_url
    assert_selector "h1", text: "Psts"
  end

  test "creating a Pst" do
    visit psts_url
    click_on "New Pst"

    fill_in "Image", with: @pst.image
    click_on "Create Pst"

    assert_text "Pst was successfully created"
    click_on "Back"
  end

  test "updating a Pst" do
    visit psts_url
    click_on "Edit", match: :first

    fill_in "Image", with: @pst.image
    click_on "Update Pst"

    assert_text "Pst was successfully updated"
    click_on "Back"
  end

  test "destroying a Pst" do
    visit psts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pst was successfully destroyed"
  end
end
