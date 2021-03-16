class LanguagesController < ApplicationController
  before_action :set_language, only: [:show, :update, :destroy]

  # GET /languages
  def index
    @languages = Language.all

    render json: @languages, only: [:name, :code]
  end

  # GET /languages/1
  def show
    render json: @language
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_language
      @language = Language.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def language_params
      params.require(:language).permit(:name, :code)
    end
end
