# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(ClubMailer, type: :mailer) do
  describe 'notify' do
    let(:mail) { described_class.with(emails: ['to@example.org'], subject: 'test subject', body: 'test body').send_mail }

    it 'renders the headers' do
      expect(mail.subject).to(eq('test subject'))
      expect(mail.to).to(eq(['to@example.org']))
      expect(mail.from).to(eq(['testemailfor431@gmail.com']))
    end

    it 'renders the body' do
      expect(mail.body.encoded).to(match('test body'))
    end
  end
end
