require 'rails_helper'

RSpec.describe Phone, type: :model do
  it "is valid with a number" do
    phone = Phone.new(number: "1234567890")
    expect(phone).to be_valid
  end

  it "is invalid without a number" do
    phone = Phone.new
    phone.valid?
    expect(phone.errors[:number]).to include("can't be blank")
  end

  it "is invalid with a duplicate number" do
    Phone.create(number: "1234567890")
    phone = Phone.new(number: "1234567890")
    phone.valid?
    expect(phone.errors[:number]).to include("has already been taken")
  end
end
