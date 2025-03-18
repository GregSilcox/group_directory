require 'rails_helper'

RSpec.describe "email_addresses/show", type: :view do
  before(:each) do
    assign(:email_address, EmailAddress.create!(
      address: "Address",
      kind: "Kind",
      status: "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Kind/)
    expect(rendered).to match(/Status/)
  end
end
