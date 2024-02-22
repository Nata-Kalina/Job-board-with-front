class CompaniesController < ApplicationController

  include AuthenticationCheck

    before_action :is_user_logged_in, except: %i[show index]
    before_action :set_company, only: [:show, :update, :destroy]

  # GET /companies or /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1 or /companies/1.json
  def show
    @company
  end
  
  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies or /companies.json
  def create
    @company = Company.new(company_params)
    @company.user_id = current_user.id
    respond_to do |format|
      if @company.save
        format.html { redirect_to company_url(@company), notice: "Company was successfully created." }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    if check_access
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to company_url(@company), notice: "Company was successfully updated." }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    if check_access
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url, notice: "Company was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:title, :about, :benefits, :industry, :website, :location, :email, :phone, :linkedin)
    end

    def check_access
      if (@company.user_id != current_user.id) 
        render json: { message: "The current user is not authorized for that action."}, status: :unauthorized
        return false
      end
      true
    end
end
