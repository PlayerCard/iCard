require "test_helper"

feature "Creating Cards" do
  scenario "Referee can book a player for an offense" do
    sign_in(:referee)
    visit game_path(:game1)

    click_on "Book Player"
    fill_in 'color', with: 'Yellow'
    fill_in 'comments', with: 'Did some not cool stuff'

    click_on 'Book Player'
    page.text.must_contain 'Player successfully booked with Yellow Card'
  end


  scenario "Can't book player with incomplete Card form" do
    sign_in(:ref_1)
    visit game_path(:game1)

    click_on "Book Player"
    fill_in 'color', with: 'Green'
    fill_in 'comments', with: ''

    click_on 'Book Player'
    page.text.must_contain 'error'
  end


  scenario "Non-referee users cannot create cards" do
    sign_in(:player_1)
    visit new_game_card_path(games(:game1))
    # Below assertions will depend on authorization policies
    page.must_have_content 'cannot card players'

    visit game_path(games(:game1))

    page.text.wont_contain 'Book Player'
  end
end
