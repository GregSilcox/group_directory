require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        street1: "Street1",
        street2: "Street2",
        city: "City",
        state: "State",
        country: "Country",
        zipcode: "Zipcode"
      ),
      Address.create!(
        street1: "Street1",
        street2: "Street2",
        city: "City",
        state: "State",
        country: "Country",
        zipcode: "Zipcode"
      )
    ])
  end

  it "renders a list of addresses" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Street1".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Street2".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("City".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("State".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Country".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Zipcode".to_s), count: 2
  end
end
