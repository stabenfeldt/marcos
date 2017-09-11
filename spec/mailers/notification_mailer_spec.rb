require "rails_helper"

RSpec.describe NotificationMailer, :type => :mailer do
  describe "bike_due" do
    let(:user) { Fabricate(:user) }
    let(:bike_part) { Fabricate(:bike_part) }
    let(:bike) { Fabricate(:bike, user: user) }

    subject(:email) { NotificationMailer.bike_due(bike) }

    it "delivers to the invoice email" do
      expect(email).to deliver_to(user.email)
    end

    it "contains the name of the part that needs service" do
      expect(email).to have_body_text(bike_part.part.name)
    end

    it "has a late invoice subject" do
      expect(email).to have_subject(/Late Invoice/)
    end

  end
end

