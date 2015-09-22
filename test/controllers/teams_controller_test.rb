require "test_helper"

class TeamsControllerTest < ActionController::TestCase
  def team
    @team ||= teams :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:teams)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Team.count") do
      post :create, team: {  }
    end

    assert_redirected_to team_path(assigns(:team))
  end

  def test_show
    get :show, id: team
    assert_response :success
  end

  def test_edit
    get :edit, id: team
    assert_response :success
  end

  def test_update
    put :update, id: team, team: {  }
    assert_redirected_to team_path(assigns(:team))
  end

  def test_destroy
    assert_difference("Team.count", -1) do
      delete :destroy, id: team
    end

    assert_redirected_to teams_path
  end
end
