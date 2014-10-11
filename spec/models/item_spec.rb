require 'spec_helper'

describe Item do
  let(:player) { FactoryGirl.create(:player) }
  before { @item = player.items.build(description: "Lorem ipsum") }

  subject { @item }

  it { should respond_to(:description) }
  it { should respond_to(:url) }
  it { should respond_to(:player_id) }
  its(:player) { should eq player }

  it { should be_valid }

  describe "when player_id is not present" do
    before { @item.player_id = nil }
    it { should_not be_valid }
  end

  describe "with blank description" do
    before { @item.description = " " }
    it { should_not be_valid }
  end

  describe "with description that is too long" do
    before { @item.description = "a" * 141 }
    it { should_not be_valid }
  end
end
