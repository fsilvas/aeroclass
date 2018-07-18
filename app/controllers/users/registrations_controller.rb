class Users::RegistrationsController < Devise::RegistrationsController
before_filter :configure_sign_up_params, only: [:create]
 before_filter :configure_account_update_params, only: [:update]


  # GET /resource/sign_up
   def new
     redirect_to root_path
   end

  # POST /resource
   def create
     redirect_to root_path
   end

  # GET /resource/edit
   def edit
     super
   end

  # PUT /resource
   def update
     @user = User.find(current_user.id)

    if params[:user][:password].blank?
      if @user.update_without_password(user_params)
        set_flash_message :notice, :updated
        # Sign in the user bypassing validation in case his password changed
        sign_in @user, :bypass => true
        redirect_to after_update_path_for(@user)
      else
        respond_with_navigational(resource) do
          render :edit
        end
      end
    else
      if @user.update_with_password(user_params)
        set_flash_message :notice, :updated
        # Sign in the user bypassing validation in case his password changed
        sign_in @user, :bypass => true
        redirect_to after_update_path_for(@user)
      else
        clean_up_passwords(resource)
        set_flash_message :notice, @user.errors.full_messages.map { |msg| '<li>'+msg+'</li>' }.join
        respond_with_navigational(resource) do
          render :change_password
        end
      end
    end
     
   end

  # DELETE /resource
   def destroy
     super
   end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
   def cancel
     super
   end

   protected

  # You can put the params you want to permit in the empty array.
   def configure_sign_up_params
    # devise_parameter_sanitizer.for(:sign_up) << :attribute
   end

  # You can put the params you want to permit in the empty array.
   def configure_account_update_params
     
   end

  # The path used after sign up.
   def after_sign_up_path_for(resource)
     super(resource)
   end

   def after_update_path_for(resource)
     root_path
   end


  # The path used after sign up for inactive accounts.
   def after_inactive_sign_up_path_for(resource)
     super(resource)
   end

   protected

  
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation, :encrypted_password,:current_password)
  end
end
