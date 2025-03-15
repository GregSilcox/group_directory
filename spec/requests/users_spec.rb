require 'rails_helper'

RSpec.describe "/users", type: :request do
  let(:valid_attributes) {
    FactoryBot.attributes_for(:user)
  }

  let(:invalid_attributes) {
    { email_address: nil, password: nil, password_confirmation: nil }
  }

  describe "GET /index" do
  end

  describe "GET /show" do
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_user_url
      Rails.logger.info "Response: #{ response.body }" # This will log the text to the Rails log
      expect(response.body).to include("l User")
    end
  end
end
