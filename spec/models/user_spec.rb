require 'rails_helper'

describe User do
  it "sends an email when the user is created" do
    user = FactoryBot.create(:user)
    UserMailer.deliveries.last.to.should eq [user.email]
  end
end
