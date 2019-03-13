class ResultsController < ApplicationController
  def index
    @search_results = PgSearch.multisearch(params[:query])
  end
end
