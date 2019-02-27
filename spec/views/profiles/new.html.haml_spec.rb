require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      :nickname => "MyString",
      :email => "MyString",
      :password => "MyString",
      :password_confirmation => "MyString",
      :self_introduction => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :first_name_kana => 1,
      :last_name_kana => 1,
      :zip_code => 1,
      :prefecture => "MyString",
      :city => "MyString",
      :ddress1 => "MyString",
      :ddress2 => "MyString",
      :phone_number => "MyString",
      :user => nil
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input[name=?]", "profile[nickname]"

      assert_select "input[name=?]", "profile[email]"

      assert_select "input[name=?]", "profile[password]"

      assert_select "input[name=?]", "profile[password_confirmation]"

      assert_select "input[name=?]", "profile[self_introduction]"

      assert_select "input[name=?]", "profile[first_name]"

      assert_select "input[name=?]", "profile[last_name]"

      assert_select "input[name=?]", "profile[first_name_kana]"

      assert_select "input[name=?]", "profile[last_name_kana]"

      assert_select "input[name=?]", "profile[zip_code]"

      assert_select "input[name=?]", "profile[prefecture]"

      assert_select "input[name=?]", "profile[city]"

      assert_select "input[name=?]", "profile[ddress1]"

      assert_select "input[name=?]", "profile[ddress2]"

      assert_select "input[name=?]", "profile[phone_number]"

      assert_select "input[name=?]", "profile[user_id]"
    end
  end
end
