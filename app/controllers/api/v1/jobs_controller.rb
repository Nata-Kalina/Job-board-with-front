class Api::V1::JobsController < ApplicationController

    include AuthenticationCheck

    before_action :is_user_logged_in
    before_action :set_job, only: [:show, :update, :destroy]


    # GET /jobs or /jobs.json
    def index
      @jobs = Job.all
    end
  
    # GET /jobs/1 or /jobs/1.json
    def show
      @job.update(views: @job.views + 1)
    end
  
    # POST /jobs or /jobs.json
    def create
      @company = Company.find(params[:company_id])
      @job = @company.jobs.new(job_params)
      @job.company_id = @company.id
  
      respond_to do |format|
        if @job.save
          format.html { redirect_to job_url(@job), notice: "Job was successfully created." }
          format.json { render :show, status: :created, location: @job }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /jobs/1 or /jobs/1.json
    def update
      @company = Company.find(params[:company_id])
      if @company.id != @job.company_id
        render json: { message: "The current user is not authorized for that action."}, status: :unauthorized
      else
        respond_to do |format|
          if @job.update(job_params)
            format.html { redirect_to job_url(@job), notice: "Job was successfully updated." }
            format.json { render :show, status: :ok, location: @job }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @job.errors, status: :unprocessable_entity }
          end
        end
      end 
    end
  
    # DELETE /jobs/1 or /jobs/1.json
    def destroy
      @company = Company.find(params[:company_id])
      if @company.id != @job.company_id
        render json: { message: "The current user is not authorized for that action."}, status: :unauthorized
      else
        @job.destroy
        respond_to do |format|
            format.html { redirect_to jobs_url, notice: "Job was successfully destroyed." }
            format.json { head :no_content }
        end
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_job
        @job = Job.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def job_params
        params.require(:job).permit(:title, :description, :location, :categoty, :remote, :salary, :requirements, :responsibilities, :application_deadline)
      end

end
