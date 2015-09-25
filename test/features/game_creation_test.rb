require "test_helper"

feature "Creating Games" do
  # Following tests for admin role - not yet implemented

  # scenario "League can create new games" do
  #   login(:admin) #leagueAdmin? whats name of league admin class?
  #   visit league_path(:league1)

  #   click_on "Create Game"
  #   select('lions' 'Home Team')
  #   select('tigers' 'Away Team')
  #   fill_in 'game_location', with: "Seattle, Pike Place Park"
  #   fill_in 'game_time', with: Time.now
  #   fill_in 'Referee', with: 5

  #   click_on 'Schedule Game'
  #   page.text.must_contain 'Game successfully scheduled'
  # end

  # scenario "Can't create games with incomplete form" do
  #   login(:admin)
  #   visit league_path(:league1)

  #   click_on "Create Game"

  #   click_on 'Schedule Game'
  #   page.text.must_contain 'prohibited this game from being saved'
  # end

  # scenario "Non-league admins can't schedule new games" do
  #   sign_in(:player_1)
  #   visit new_game_path
  #   page.must_have_content "not authorized"
  # end

  # scenario "Non-league admins can't see new game button" do
  #   sign_in(:player_1)
  #   visit league_path(:league1)
  #   page.text.wont_contain "Schedule New Game"
  # end
end
