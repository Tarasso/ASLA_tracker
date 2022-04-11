# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :account_creating?, only: [:user_dashboard]
  after_action :req_points, only: %i[user_dashboard]
  after_action :reset_values, only: %i[user_dashboard]
  skip_before_action :authenticate_user!

  def home
    @newsletter = Newsletter.order(:created_at).reverse_order.first
    @carousel_pics = Carousel.all
  end

  def help; end

  def about; end

  def faq; end

  def officers
    @officer_pics = OfficerPic.all
  end

  def unauthorized; end

  def req_points
    if params.key?(:required_points) && session[:isAdmin]
      @group3 = params[:required_points]
      File.open('global_variables.txt', 'w') { |f| f.write(@group3) } if @group3
    end
  end

  def reset_values
    if (params.key?(:dues)  && session[:isAdmin]) || (params.key?(:points) && session[:isAdmin])

      @group4 = params[:dues]
      @group5 = params[:points]

      @student_members = StudentMember.all

      if @group4 == 'dues'
        @student_members.each do |student|
          student.update!(dues_paid: false)
        end
      end
      if @group5 == 'points'
        @student_members.each do |student|
          student.update!(meeting_point_amount: 0)
          student.update!(social_point_amount: 0)
          student.update!(informational_point_amount: 0)
          student.update!(fundraiser_point_amount: 0)
          student.update!(total_points: 0)
        end
      end
    end
  end

  def user_dashboard
    @is_student = !StudentMember.where(uid: session[:uid]).empty?
    @user = if @is_student
              StudentMember.find(session[:userID])
            else
              BusinessProfessional.find(session[:userID])
            end

    if params.key?(:group1) || params.key?(:group2) || params.key?(:group3)

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
    @student_members = StudentMember.all
    @student_members = @student_members.sort_by(&:total_points).reverse
  end

  def events; end

  def select_account_type; end

  def points_leaderboard
    @student_members = StudentMember.all
    @student_members = @student_members.sort_by(&:total_points).reverse
  end

  # def is_student?
  #   puts 'check'
  #   puts !StudentMember.where(uid: session[:uid]).empty?
  #   return !StudentMember.where(uid: session[:uid]).empty?
  # end
end
