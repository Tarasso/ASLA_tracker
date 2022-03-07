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
    session[:uid] = resource_or_scope.uid
    session[:email] = resource_or_scope.email
    session[:profile_pic] = resource_or_scope.avatar_url
    if StudentMember.where(uid: resource_or_scope.uid).empty? && BusinessProfessional.where(uid: resource_or_scope.uid).empty?
      pages_select_account_type_path
    else
      session[:isMember] = StudentMember.find_by(uid: session[:uid])
      session[:isBusinessProfessional] = BusinessProfessional.find_by(uid: session[:uid])
      session[:isAdmin] = StudentMember.where(uid: session[:uid]).pick(:member_title) == 'officer' || false
      session[:userID] = StudentMember.where(uid: session[:uid]).pick(:id) || BusinessProfessional.where(uid: session[:uid]).pick(:id)
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
