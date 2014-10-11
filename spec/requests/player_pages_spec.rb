require 'spec_helper'
require 'application_helper'

describe 'Player pages' do

  subject { page }

  describe "profile page" do
    let(:player) { FactoryGirl.create(:player) }
    let!(:i1) { FactoryGirl.create(:item, player: player, description: "Foo") }
    let!(:i2) { FactoryGirl.create(:item, player: player, description: "Bar") }

    before { visit player_path(player) }

    it { should have_content(player.name) }
    it { should have_title(player.name) }

    describe "items" do
      it { should have_content(i1.description) }
      it { should have_content(i2.description) }
      it { should have_content(player.items.count) }
    end
  end

end