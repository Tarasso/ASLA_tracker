class ClubMailer < ApplicationMailer
    default from: "testemailfor431@gmail.com"

    layout "mailer"

    def send_mail
        @subject = params[:subject]
        @emails = params[:emails]
        @body = params[:body]
        @group1 = params[:group1]
        @group2 = params[:group2]
        @group3 = params[:group3]


        recipients = @emails.split(", ")

        if @group1 == "officers"
            recipients += StudentMember.where(member_title: '1').pluck(:email)
        end

        if @group2 == "non_officers"
            recipients += StudentMember.where(member_title: '0').pluck(:email)
        end

        if @group3 == "business"
            recipients += BusinessProfessional.pluck(:email)
        end

        mail(to: recipients.uniq, subject: @subject)
    end
end
