class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  skip_forgery_protection only: [:create]

  respond_to :json
  
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password])
  end

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed resource
  end

  def register_success
    
    render json: { message: 'Signed up sucessfully.' }, status: :created
  end

  def register_failed resource
    render json: { message: resource.errors.full_messages }, status: :bad_request
  end


end
