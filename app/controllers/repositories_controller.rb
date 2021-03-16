class RepositoriesController < ApplicationController
  before_action :set_repository, only: [:show, :update, :destroy]

  # GET /repositories
  def index
    @repositories = Repository.all

    render json: @repositories
  end

  # GET /repositories/1
  def show
    render json: @repository
  end


  # será necessário atualizar alguma info pelo front? deixado por enquanto...
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
      params.require(:repository).permit(:name, :owner_name, :owner_avatar, :description, :creation_date, :last_activity_date, :homepage, :language_id, :forks, :issues, :watchers, :stars, :score, :repo_url, :github_id)
    end
end
