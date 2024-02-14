class Api::V1::ApplicationsController < ApplicationController

    include AuthenticationCheck

    before_action :is_user_logged_in
    before_action :set_account
    before_action :set_job, only: [:create]
    before_action :set_application, only: [:show, :update, :destroy]
    before_action :check_access

  # GET /applications or /applications.json
  def index
    @account = Account.find(params[:account_id])
    respond_to do |format|
    if @account.application
        format.html { redirect_to application_url(@application), notice: "Application was successfully created." }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    
  end

  # GET /applications/1 or /applications/1.json
  def show
    respond_to do |format|
        if @application
            format.html { redirect_to application_url(@application), notice: "Application was successfully created." }
            format.json { render :show, status: :created, location: @application }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @application.errors, status: :unprocessable_entity }
          end
  end

  # POST /applications or /applications.json
  def create
    @account = Account.find(params[:account_id])
    @job = Job.find(application_params[:job_id])
    @application = @account.applications.new(application_params)
    @application.account_id = @account.id
    @application.job_id = @job.id
    
    respond_to do |format|
      if @application.save
        format.html { redirect_to application_url(@application), notice: "Application was successfully created." }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1 or /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to application_url(@application), notice: "Application was successfully updated." }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1 or /applications/1.json
  def destroy
    respond_to do |format|
        if @application.destroy
            format.html { redirect_to applications_url, notice: "Application was successfully destroyed." }
            format.json { head :no_content }
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @application.errors, status: :unprocessable_entity }
        end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def application_params
      params.require(:application).permit(:resume, :cover_letter, :status, :notes)
    end

    def set_account
        @account = Account.find_by(id: params[:account_id])
      end
  
      def set_job
        @job = Job.find_by(id: application_params[:job_id])
      end
  
      def check_access 
        @account = Account.find(params[:account_id])
        if @account.user_id != current_user.id
          render json: { message: "The current user is not authorized for that action."}, status: :unauthorized
        end
      end

end
