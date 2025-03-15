require 'rails_helper'

RSpec.describe "/phones", type: :request do
  let(:valid_attributes) {
    FactoryBot.attributes_for(:phone)
  }

  let(:invalid_attributes) {
    { number: nil }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Phone.create! valid_attributes
      get phones_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      phone = Phone.create! valid_attributes
      get phone_url(phone)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_phone_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      phone = Phone.create! valid_attributes
      get edit_phone_url(phone)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Phone" do
        expect {
          post phones_url, params: { phone: valid_attributes }
        }.to change(Phone, :count).by(1)
      end

      it "redirects to the created phone" do
        post phones_url, params: { phone: valid_attributes }
        expect(response).to redirect_to(phone_url(Phone.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Phone" do
        expect {
          post phones_url, params: { phone: invalid_attributes }
        }.to change(Phone, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post phones_url, params: { phone: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { number: "2234567890" }
      }

      it "updates the requested phone" do
        phone = Phone.create! valid_attributes
        patch phone_url(phone), params: { phone: new_attributes }
        phone.reload
        expect(phone.number).to eq("2234567890")
      end

      it "redirects to the phone" do
        phone = Phone.create! valid_attributes
        patch phone_url(phone), params: { phone: new_attributes }
        phone.reload
        expect(response).to redirect_to(phone_url(phone))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        phone = Phone.create! valid_attributes
        patch phone_url(phone), params: { phone: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested phone" do
      phone = Phone.create! valid_attributes
      expect {
        delete phone_url(phone)
      }.to change(Phone, :count).by(-1)
    end

    it "redirects to the phones list" do
      phone = Phone.create! valid_attributes
      delete phone_url(phone)
      expect(response).to redirect_to(phones_url)
    end
  end
end
