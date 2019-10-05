# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: %i[new create cancel]
  before_action :set_user, except: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(permitted_params)
    if @user.save
      redirect_to root_path, notice: 'Administrador creado con éxito'
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy
    @user.discard
    redirect_to users_path, notice: 'Usuario eliminado'
  end

  private

  def permitted_params
    params.require(:user).permit(:email, :password, :name)
  end

  def set_user
    @user = User.find(params[:format])
  end
end
