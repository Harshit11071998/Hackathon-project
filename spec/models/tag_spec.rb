require "rails_helper"

RSpec.describe Tag, type: :model do
  context "Association test" do
    it { should belong_to(:challenge) }
  end
end
