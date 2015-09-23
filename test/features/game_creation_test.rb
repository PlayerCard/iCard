require "test_helper"

feature "Creating Gamess" do
  scenario "League can create new games" do
    login(:admin) #leagueAdmin? whats name of league admin class?
    visit league_path[:id = 1]

    click_on "Create Game"
    fill_in 'home_team' with:
    fill_in 'away_team' with:
    fill_in 'game_loaction' with:
    fill_in 'game_time' with:
    fill_in 'Referee' with:

    click_on 'Schedule Game'
    page.text.must_contain 'Game successfully scheduled'
  end

  scenario "Can't create games with incomplete form" do
    login(:admin)
    visit league_path[:id = 1]

    click_on "Create Game"
    fill_in 'game_time' with: ''

    click_on 'Schedule Game'
    page.text.must_contain 'prohibited this game from being saved'
  end

  scenario "Non-league admins can't schedule new games" do
    sign_in(:player)
    visit new_game_path
    page.text.must_contain "not authorized"
  end

  scenario "Non-league admins can't see new game button" do
    sign_in(:player)
    visit league_path[:id]
    page.text.wont_contain "Schedule New Game"
  end
end
