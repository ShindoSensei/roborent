class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]


  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    # super
    respond_to do |format|
      format.html { render :edit, locals:{ajax_render:'edit_profile_form'} }
      format.js { render :edit}
    end
  end

  # PUT /resource
  # def update
    # respond_to do|format|
    # puts account_update_params

    # @user.update(update_params)
    # def listings
    #   @listings = current_user.properties
    #   @properties = Property.all
    #   #Rails automatically receives incoming ajax js request and knows to look for corresponding .js.erb file in views/registrations/listings.js.erb  instead of a .html.erb file.
    # end

    # User.update(current_user.id, :phone => )
  # end


  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  # def account_update_params
  #   params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :current_password, :phone, :nationality, :occupation, :photo)
  # end

  def account_update_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :nationality, :phone, :occupation, :photo, :current_password)
  end

  # def update_params
  #   params.require(:user).permit(:email, :first_name, :last_name, :password, :nationality, :phone, :occupation, :photo)
  # end

    # def set_user
    #   @user = current_user.id
    # end

end
