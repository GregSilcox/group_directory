require 'rails_helper'

RSpec.describe "phones/edit", type: :view do
  let(:phone) {
    Phone.create!(
      number: "MyString"
    )
  }

  before(:each) do
    assign(:phone, phone)
  end

  it "renders the edit phone form" do
    render

    assert_select "form[action=?][method=?]", phone_path(phone), "post" do

      assert_select "input[name=?]", "phone[number]"
    end
  end
end
