# frozen_string_literal: true

class ClubMailer < ApplicationMailer
  default from: 'testemailfor431@gmail.com'

  layout 'mailer'

  def send_mail
    @subject = params[:subject]
    @emails = params[:emails]
    @body = params[:body]
    @group1 = params[:group1]
    @group2 = params[:group2]
    @group3 = params[:group3]

    recipients = @emails.split(', ')

    recipients += StudentMember.where(member_title: '1').pluck(:email) if @group1 == 'officers'

    recipients += StudentMember.where(member_title: '0').pluck(:email) if @group2 == 'non_officers'

    recipients += BusinessProfessional.pluck(:email) if @group3 == 'business'

    mail(to: recipients.uniq, subject: @subject)
  end
end
