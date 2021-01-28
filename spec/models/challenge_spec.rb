require "rails_helper"

RSpec.describe Challenge, type: :model do
  let(:user) { build(:user) }
  let(:challenge) { build(:challenge) }
  before(:each) do
    challenge.user = user
  end
  context "Association test" do
    it { should belong_to(:user) }
    it { should have_many(:votes) }
    it { should have_many(:collaborate) }
  end
  context "Validation test" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end
  # context "#voted_by?" do
  #   it "check wether vote is created by current user" do
  #     expect(challenge.voted_by?(user)).to be_valid
  #   end
  # end
end
