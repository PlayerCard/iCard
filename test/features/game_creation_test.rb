require "test_helper"

feature "Creating Gamess" do
  scenario "League can create new games" do
    login(:admin) #leagueAdmin? whats name of league admin class?
    visit league_path(1)

    click_on "Create Game"
    select('lions' 'Home Team')
    select('tigers' 'Away Team')
    fill_in 'game_loaction' with: "Seattle, Pike Place Park"
    fill_in 'game_time' with: Time.now
    fill_in 'Referee' with: 5

    click_on 'Schedule Game'
    page.text.must_contain 'Game successfully scheduled'
  end

  scenario "Can't create games with incomplete form" do
    login(:admin)
    visit league_path(1)

    click_on "Create Game"

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
    visit league_path(1)
    page.text.wont_contain "Schedule New Game"
  end
end
