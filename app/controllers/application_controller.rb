class ApplicationController < ActionController::Base
  include Pagy::Backend

  def index
    @pagy, @records = pagy(Highlight.includes(:team).includes(:player))
  end
end
