require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:model) { FactoryBot.create :user }

  it() { expect(model.email_address).to eq "greg.silcox+test@gmail.com" }
end
