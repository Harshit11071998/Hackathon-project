require "rails_helper"

RSpec.describe User, type: :model do
  context "Association test" do
    it { should have_many(:challenges).dependent(:destroy) }
    it { should have_many(:votes).dependent(:destroy) }
    it { should have_many(:collaborate).dependent(:destroy) }
    it { should validate_presence_of(:empid) }
  end
end
