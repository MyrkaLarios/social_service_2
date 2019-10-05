# frozen_string_literal: true

class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters, only: %i[create]

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:user_type])
  end
end
