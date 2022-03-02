# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home; end

  def about; end

  def contact; end

  def mail
    if params.key?(:emails)

      @emails = params[:emails]
      @group1 = params[:group1]
      @group2 = params[:group2]
      @group3 = params[:group3]

      # recipients is an array
      recipients = @emails.split(', ')

      recipients += StudentMember.where(member_title: '1').pluck(:email) if @group1 == 'officers'

      recipients += StudentMember.where(member_title: '0').pluck(:email) if @group2 == 'non_officers'

      recipients += BusinessProfessional.pluck(:email) if @group3 == 'business'

      recipients = recipients.uniq

      @recipients_str = recipients.join('\n')
    end
  end

  def officers; end

  def unauthorized; end
end
