require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
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
      ),
      Profile.create!(
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
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => "Nickname".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Password Confirmation".to_s, :count => 2
    assert_select "tr>td", :text => "Self Introduction".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Prefecture".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Ddress1".to_s, :count => 2
    assert_select "tr>td", :text => "Ddress2".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
