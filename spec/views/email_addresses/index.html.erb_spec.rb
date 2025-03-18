require 'rails_helper'

RSpec.describe "email_addresses/index", type: :view do
  before(:each) do
    assign(:email_addresses, [
      EmailAddress.create!(
        address: "Address",
        kind: "Kind",
        status: "Status"
      ),
      EmailAddress.create!(
        address: "Address",
        kind: "Kind",
        status: "Status"
      )
    ])
  end

  it "renders a list of email_addresses" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Address".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Kind".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
  end
end
