require "rails_helper"

RSpec.describe Challenge, type: :model do
  context "Association test" do
    it { should belong_to(:user) }
    it { should have_many(:votes) }
    it { should have_many(:collaborate) }
  end
  context "Validation test" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end
end
