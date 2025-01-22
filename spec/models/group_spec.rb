require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { FactoryBot.create :group }

  it() { expect(group.name).to eq "Grammy and Pappy's Decendants" }
end
