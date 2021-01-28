require "rails_helper"

RSpec.describe Collaborate, type: :model do
  let(:user) { build(:user) }
  let(:challenge) { build(:challenge) }
  before(:each) do
    # sign_in(user)
    challenge.user = user
  end
  context "Association test" do
    it { should belong_to(:user) }
    it { should belong_to(:challenge) }
  end
end
