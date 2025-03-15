require 'rails_helper'

RSpec.describe "phones/show", type: :view do
  before(:each) do
    assign(:phone, Phone.create!(
      number: "Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)
  end
end
