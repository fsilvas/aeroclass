class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, :except => [:resetPassword]
  load_and_authorize_resource

  layout "login", :only => [ :resetPassword ]


  def index
    @users = User.all.with_any_role(:admin, :bodega, :gerencia, :asistente, :produccion)
    @users = @users.sort_by{|e| e[:name]}

  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.remove_role @user.roles.first.name

    case params[:role]
    when '1'
      @user.add_role :admin
    when '2'
      @user.add_role :bodega
    when '3'
      @user.add_role :gerencia
    when '4'
      @user.add_role :asistente
    when '5'
      @user.add_role :produccion
    end
    respond_to do |format|
      if @user.save
        format.html { redirect_to index_users_path, notice: 'Usuario actualizado satisfactoriamente.' }
        format.json { redirect_to root_path }
      else
        format.html { redirect_to edit_user_path(@user), notice: @user.errors.full_messages.map { |msg| '<li>'+msg+'</li>' }.join}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @user = User.new(user_params)
    @pass = (0...8).map { (65 + rand(26)).chr }.join
    @user.password = @pass
    @user.password_confirmation = @pass
    case params[:role]
    when '1'
      @user.add_role :admin
    when '2'
      @user.add_role :bodega
    when '3'
      @user.add_role :gerencia
    when '4'
      @user.add_role :asistente
    when '5'
      @user.add_role :produccion
    end
    respond_to do |format|
      if SendMailer.sample_email(@user, @pass).deliver
        if @user.save
          format.html { redirect_to all_users_path, notice: 'Usuario creado satisfactoriamente.' }
          format.json { redirect_to root_path }
        else
          format.html { redirect_to new_user_path, notice: @user.errors.full_messages.map { |msg| '<li>'+msg+'</li>' }.join}
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to new_user_path, notice: 'Problemas con el correo, por favor intente nuevamente.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def resetPassword
    @pass = ""
    if request.post?
      @email = params[:email]
      respond_to do |format|
        if User.exists? email: @email
          @user = User.find_by email: @email
          @pass = (0...8).map { (65 + rand(26)).chr }.join
          @user.password = @pass
          @user.password_confirmation = @pass
          if SendMailer.password_email(@user, @pass).deliver
            if @user.save
              format.html { redirect_to new_user_session_path, notice: 'Revise su correo' }
            else
              format.html { redirect_to new_user_session_path, notice: 'Error'}
            end
          end
        else
          format.html { redirect_to reset_password_path, notice: 'Este correo no está registrado en el sistema' }
        end
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'Usuario eliminado.' }
      format.json { head :no_content }
    end
  end


  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation, :encrypted_password,:current_password)
  end
end
