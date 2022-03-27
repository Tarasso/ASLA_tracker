# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :admin?, only: %i[mail]

  def home
    @newsletter = Newsletter.order(:created_at).reverse_order.first
    @carousel_pics = Carousel.all
  end

  def about; end

  def contact; end

  def mail
    if params.key?(:group1) or params.key?(:group2) or params.key?(:group3)

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

  def officers
    @officer_pics = OfficerPic.all
  end

  def unauthorized; end

  def user_dashboard
    @is_student = !StudentMember.where(uid: session[:uid]).empty?
    @user = if @is_student
              StudentMember.find(session[:userID])
            else
              BusinessProfessional.find(session[:userID])
            end

    if params.key?(:group1) or params.key?(:group2) or params.key?(:group3)

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

  def select_account_type; end

  # def is_student?
  #   puts 'check'
  #   puts !StudentMember.where(uid: session[:uid]).empty?
  #   return !StudentMember.where(uid: session[:uid]).empty?
  # end
end
