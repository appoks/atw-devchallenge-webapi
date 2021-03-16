require 'test_helper'

class RepositoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repository = repositories(:one)
  end

  test "should get index" do
    get repositories_url, as: :json
    assert_response :success
  end

  test "should create repository" do
    assert_difference('Repository.count') do
      post repositories_url, params: { repository: { creation_date: @repository.creation_date, description: @repository.description, forks: @repository.forks, github_id: @repository.github_id, homepage: @repository.homepage, issues: @repository.issues, language_id: @repository.language_id, last_activity_date: @repository.last_activity_date, name: @repository.name, owner_avatar: @repository.owner_avatar, owner_name: @repository.owner_name, repo_url: @repository.repo_url, score: @repository.score, stars: @repository.stars, watchers: @repository.watchers } }, as: :json
    end

    assert_response 201
  end

  test "should show repository" do
    get repository_url(@repository), as: :json
    assert_response :success
  end

  test "should update repository" do
    patch repository_url(@repository), params: { repository: { creation_date: @repository.creation_date, description: @repository.description, forks: @repository.forks, github_id: @repository.github_id, homepage: @repository.homepage, issues: @repository.issues, language_id: @repository.language_id, last_activity_date: @repository.last_activity_date, name: @repository.name, owner_avatar: @repository.owner_avatar, owner_name: @repository.owner_name, repo_url: @repository.repo_url, score: @repository.score, stars: @repository.stars, watchers: @repository.watchers } }, as: :json
    assert_response 200
  end

  test "should destroy repository" do
    assert_difference('Repository.count', -1) do
      delete repository_url(@repository), as: :json
    end

    assert_response 204
  end
end
