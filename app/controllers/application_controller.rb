class ApplicationController < ActionController::Base
  def index
    @highlights = Highlight.includes(:team).includes(:player)
  end
end
