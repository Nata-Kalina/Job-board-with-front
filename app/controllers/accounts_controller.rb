class AccountsController < ApplicationController
  
  include AuthenticationCheck

    before_action :is_user_logged_in
    before_action :set_account, only: [:show, :update, :destroy]

  # GET /accounts or /accounts.json
  def index
    @accounts = Account.where(user_id: current_user.id)
  end

  # GET /accounts/1 or /accounts/1.json
  def show
      if check_access
        @account
    end
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)
    @account.user_id = current_user.id
    respond_to do |format|
      if @account.save
        format.html { redirect_to account_url(@account), notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    if check_access
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to account_url(@account), notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    if check_access
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:first_name, :last_name, :phone, :location, :about, :role, :linkedin)
    end

    def check_access
      if (@account.user_id != current_user.id) 
        render json: { message: "The current user is not authorized for that data."}, status: :unauthorized
        return false
      end
      true
    end

end