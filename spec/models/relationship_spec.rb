require 'spec_helper'

describe Relationship do
  let(:user) { FactoryGirl.create(:user) }
  let(:player) { FactoryGirl.create(:player) }
  before do
    @relationship = Relationship.new
    @relationship.user = user
    @relationship.player = player
  end

  subject { @relationship }

  it { should be_valid }

  describe "follower methods" do
    it { should respond_to(:user) }
    it { should respond_to(:player) }
  end

  describe "when followed id is not present" do
    before { @relationship.user_id = nil }
    it { should_not be_valid }
  end

  describe "when follower id is not present" do
    before { @relationship.player_id = nil }
    it { should_not be_valid }
  end
end
