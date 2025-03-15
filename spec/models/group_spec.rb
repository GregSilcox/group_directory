require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { create :group }

  it() { expect(group.name).to eq "Grammy and Pappy's Decendants" }
end
