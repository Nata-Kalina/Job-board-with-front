class ApplicationController < ActionController::Base
    include ExceptionHandler

    before_action :set_query

    def set_query
        @query = Job.ransack(params[:q])
    end

end
