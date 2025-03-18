require 'rails_helper'

RSpec.describe "email_addresses/new", type: :view do
  before(:each) do
    assign(:email_address, EmailAddress.new(
      address: "MyString",
      kind: "MyString",
      status: "MyString"
    ))
  end

  it "renders new email_address form" do
    render

    assert_select "form[action=?][method=?]", email_addresses_path, "post" do

      assert_select "input[name=?]", "email_address[address]"

      assert_select "input[name=?]", "email_address[kind]"

      assert_select "input[name=?]", "email_address[status]"
    end
  end
end
