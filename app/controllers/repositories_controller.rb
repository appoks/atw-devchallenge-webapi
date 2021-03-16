require 'httparty'
require 'json'

class RepositoriesController < ApplicationController
  before_action :set_repository, only: [:show, :update]

  PER_PAGE = 5
  PAGE = 1

  # GET /repositories
  def index

    page = PAGE
    page = params[:page].to_i unless ( params[:page].to_i < 1 || params[:page] == nil )

    ## eu provavelmente deveria ter mapeado para um modelo diretamente...

    if Repository.count < 25
      @languages = Language.all
      @languages.each do |lang|
        # response = HTTParty.get('http://api.github.com/search/repositories?q=language%3Aruby&sort=stars&order=desc&per_page=5')
        response = HTTParty.get("http://api.github.com/search/repositories?q=language%3A#{lang.code}&sort=stars&order=desc&per_page=#{PER_PAGE}")
        parsed_repos = response.parsed_response
        puts parsed_repos
        parsed_repos["items"].each do |repo|
          Repository.create(
            name: repo['name'],
            owner_name: repo['owner']['login'],
            owner_avatar: repo['owner']['avatar_url'],
            description: repo['description'],
            language: Language.where(code: lang.code).first,
            creation_date: repo['created_at'],
            last_activity_date: repo['pushed_at'],
            homepage: repo['homepage'],
            forks: repo['forks'],
            issues: repo['open_issues'],
            watchers: repo['watchers'],
            stars: repo['watchers'],
            score: repo['score'],
            repo_url: repo['html_url'],
            github_id: repo['id']
          )
        end
      end
    end

    @repositories = Repository.all.order(stars: :desc)

    render json: @repositories, except: [:created_at, :updated_at],
           include: [ language: { only: [:id, :name]  }]
  end

  # GET /repositories/1
  def show
    render json: @repository,
           include: [ language: { only: [:id, :name]  }]
  end


  # será necessário atualizar alguma info pelo front? deixado por enquanto...
  #
  # PATCH/PUT /repositories/1
  def update
    if @repository.update(repository_params)
      render json: @repository
    else
      render json: @repository.errors, status: :unprocessable_entity
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repository
      @repository = Repository.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def repository_params
      params.require(:repository).permit(:last_activity_date)
    end
end
