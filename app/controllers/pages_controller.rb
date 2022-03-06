# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :admin?, only: %i[mail]

  def home;
    @newsletter = Newsletter.order(:created_at).reverse_order.first
  end

  def about; end

  def contact; end

  def mail
    if params.key?(:group1)
      
      @group1 = params[:group1]
      @group2 = params[:group2]
      @group3 = params[:group3]

      # recipients is an array
      recipients = []

      recipients += StudentMember.where(member_title: 'officer').pluck(:email) if @group1 == 'officers'

      recipients += StudentMember.where(member_title: 'member').pluck(:email) if @group2 == 'non_officers'

      recipients += BusinessProfessional.pluck(:email) if @group3 == 'business'

      recipients = recipients.uniq

      @recipients_str = recipients.join('\n')
    end
  end

  def officers; end

  def unauthorized; end

  def user_dashboard; end

  def select_account_type; end
end
