require 'rails_helper'

RSpec.describe "email_addresses/edit", type: :view do
  let(:email_address) {
    EmailAddress.create!(
      address: "MyString",
      kind: "MyString",
      status: "MyString"
    )
  }

  before(:each) do
    assign(:email_address, email_address)
  end

  it "renders the edit email_address form" do
    render

    assert_select "form[action=?][method=?]", email_address_path(email_address), "post" do

      assert_select "input[name=?]", "email_address[address]"

      assert_select "input[name=?]", "email_address[kind]"

      assert_select "input[name=?]", "email_address[status]"
    end
  end
end
