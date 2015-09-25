require "test_helper"

feature "Creating Cards" do
  scenario "Referee can book a player for an offense" do
    # Given a signed-in referee user
    sign_in(:ref_1)
    # When I click 'Book Player' and fill out the form
    game = games(:game1)
    visit game_path(game)
    first("a[href='/games/#{game.id}/cards/new']").click
    fill_in 'Color', with: 'Yellow'
    fill_in 'Comments', with: 'Did some not cool stuff'
    click_on 'Create Card'
    # Then a player should get booked
    page.text.must_contain 'Player successfully booked with Yellow Card'
  end

  scenario "Can't book player with incomplete Card form" do
    # Given a signed-in ref on a game page
    sign_in(:ref_1)
    game = games(:game1)
    visit game_path(game)
    # When click on 'book player' and submit invalid params
    first("a[href='/games/#{game.id}/cards/new']").click
    fill_in 'Color', with: 'Green'
    fill_in 'Comments', with: ''
    click_on 'Create Card'
    # Then the player shouldn't be booked
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
