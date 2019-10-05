class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters, only: %i[create]
  before_action :update_params, only: :update

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:invite, keys: [:user_type])
    end

    def update_params
      devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name])
    end
end
