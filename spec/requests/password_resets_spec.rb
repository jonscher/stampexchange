require 'spec_helper'
require 'factory_girl_rails'


RSpec.describe "PasswordResets" do
  it "emails user when requesting password reset" do
    user = FactoryGirl.create(:user)
    visit login_path
    click_link "password"
    fill_in "Email", with => user.email
    click_button "reset Password"
  end

end
