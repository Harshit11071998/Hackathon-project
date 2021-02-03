require "rails_helper"

RSpec.describe Collaborate, type: :model do
  context "Association test" do
    it { should belong_to(:user) }
    it { should belong_to(:challenge) }
  end
end
