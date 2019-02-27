require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :nickname => "Nickname",
      :email => "Email",
      :password => "Password",
      :password_confirmation => "Password Confirmation",
      :self_introduction => "Self Introduction",
      :first_name => "First Name",
      :last_name => "Last Name",
      :first_name_kana => 2,
      :last_name_kana => 3,
      :zip_code => 4,
      :prefecture => "Prefecture",
      :city => "City",
      :ddress1 => "Ddress1",
      :ddress2 => "Ddress2",
      :phone_number => "Phone Number",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nickname/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Password Confirmation/)
    expect(rendered).to match(/Self Introduction/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Prefecture/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Ddress1/)
    expect(rendered).to match(/Ddress2/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(//)
  end
end
