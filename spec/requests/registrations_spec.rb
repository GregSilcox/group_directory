require 'rails_helper'

RSpec.describe "/registrations", type: :request do
  describe "GET /new" do
    it "renders a successful response" do
      get new_registration_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    let(:valid_attributes) {
      { email: "test@example.com", password: "password123", password_confirmation: "password123" }
    }

    let(:invalid_attributes) {
      { email: "test@example.com", password: "password123", password_confirmation: "wrongpassword" }
    }

    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post registrations_url, params: { registration: valid_attributes }
        }.to change(User, :count).by(1) # Assuming User model is used for registrations
      end

      it "redirects to the created registration" do
        post registrations_url, params: { registration: valid_attributes }
        expect(response).to redirect_to(root_url) # Assuming redirection to root after registration
      end
    end

    context "with invalid parameters" do
      it "does not create a new Registration" do
        expect {
          post registrations_url, params: { registration: invalid_attributes }
        }.to change(User, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post registrations_url, params: { registration: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
