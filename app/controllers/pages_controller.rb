# frozen_string_literal: true

class PagesController < ApplicationController
  #skip_before_action :authenticate_user!

  def home; end

  def about; end

  def contact; end

  def mail; end

  def send_mail
    subject = params[:subject]
    emails = params[:emails]
    body = params[:body]
    group1 = params[:group1]
    group2 = params[:group2]
    group3 = params[:group3]
    ClubMailer.with(emails: emails, subject: subject, body: body,
                    group1: group1, group2: group2, group3: group3
    ).send_mail.deliver_later
  end

  def officers; end
end
