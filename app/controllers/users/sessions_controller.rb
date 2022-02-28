# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource_or_scope)
    #Rails.logger.debug('HERE')
    #Rails.logger.debug(resource_or_scope.inspect)
    stored_location_for(resource_or_scope) || root_path
  end
end
