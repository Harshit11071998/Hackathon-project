require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  let(:challenge) { build(:challenge) }
  before(:each) do
    # sign_in(user)
    challenge.user = user
  end
  context "Association test" do
    it { should have_many(:challenges).dependent(:destroy) }
    it { should have_many(:votes).dependent(:destroy) }
    it { should have_many(:collaborate).dependent(:destroy) }
  end
end
