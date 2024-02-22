class SearchController < ApplicationController
  def index
    @query = Job.ransack(params[:q])
    @jobs = @query.result(distinct: true)
  end
end
