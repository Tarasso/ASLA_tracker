# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    user = User.from_google(**from_google_params)

    if user.present?
      sign_out_all_scopes
      flash[:success] = t('devise.omniauth_callbacks.success', kind: 'Google')
      sign_in_and_redirect(user, event: :authentication)
    else
      flash[:alert] = t('devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized.")
      redirect_to(new_user_session_path)
    end
  end

  protected

  def after_omniauth_failure_path_for(_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    # Rails.logger.debug('HERE 2')
    # Rails.logger.debug(resource_or_scope.inspect)
    # Rails.logger.debug('UID TEST')
    # Rails.logger.debug(resource_or_scope.uid)
    # Rails.logger.debug(StudentMember.where(uid: resource_or_scope.uid).inspect)

    if StudentMember.where(uid: resource_or_scope.uid).empty?
      Rails.logger.debug('found new user')
      new_student_member_path
    else
      request.env['omniauth.origin'] || stored_location_for(resource_or_scope) || root_path
    end
  end

  private

  def from_google_params
    @from_google_params ||= {
      uid: auth.uid,
      email: auth.info.email,
      full_name: auth.info.name,
      avatar_url: auth.info.image
    }
  end

  def auth
    @auth ||= Rails.application.env_config['omniauth.auth'] || request.env['omniauth.auth']
  end
end
