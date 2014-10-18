require 'spec_helper'

describe Player do
  before { @player = Player.new(name: "Example User", description: "example.com") }

  subject { @player }

  it { should respond_to(:items) }
  it { should respond_to(:relationships) }
  it { should respond_to(:users) }

  describe "item associations" do

    before { @player.save }
    let!(:older_item) do
      FactoryGirl.create(:item, player: @player, created_at: 1.day.ago)
    end
    let!(:newer_item) do
      FactoryGirl.create(:item, player: @player, created_at: 1.hour.ago)
    end

    it "should have the right items in the right order" do
      expect(@player.items.to_a).to eq [newer_item, older_item]
    end
  end

  it "should destroy associated items" do
    items = @player.items.to_a
    @player.destroy
    #expect(items).not_to be_empty
    items.each do |item|
      expect(item.where(id: item.id)).to be_empty
    end
  end
end