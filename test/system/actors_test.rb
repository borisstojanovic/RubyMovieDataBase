require "application_system_test_case"

class ActorsTest < ApplicationSystemTestCase
  setup do
    @actor = actors(:one)
  end

  test "visiting the index" do
    visit actors_url
    assert_selector "h1", text: "Actors"
  end

  test "creating a Actor" do
    visit actors_url
    click_on "New Actor"

    fill_in "Bio", with: @actor.bio
    fill_in "Date of birth", with: @actor.date_of_birth
    fill_in "Firstname", with: @actor.firstname
    fill_in "Lastname", with: @actor.lastname
    click_on "Create Actor"

    assert_text "Actor was successfully created"
    click_on "Back"
  end

  test "updating a Actor" do
    visit actors_url
    click_on "Edit", match: :first

    fill_in "Bio", with: @actor.bio
    fill_in "Date of birth", with: @actor.date_of_birth
    fill_in "Firstname", with: @actor.firstname
    fill_in "Lastname", with: @actor.lastname
    click_on "Update Actor"

    assert_text "Actor was successfully updated"
    click_on "Back"
  end

  test "destroying a Actor" do
    visit actors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Actor was successfully destroyed"
  end
end
