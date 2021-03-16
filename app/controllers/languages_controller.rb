class LanguagesController < ApplicationController
  before_action :set_language, only: [:show]

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

end
