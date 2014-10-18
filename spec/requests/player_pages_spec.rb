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

    describe "follow/unfollow buttons" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

      describe "following a user" do
        before { visit player_path(player) }

        it "should increment the followed user count" do
          expect do
            click_button "Follow"
          end.to change(user.players, :count).by(1)
        end

        describe "toggling the button" do
          before { click_button "Follow" }
          it { should have_xpath("//input[@value='Unfollow']") }
        end
      end

      describe "unfollowing a user" do
        before do
          user.follow!(player)
          visit player_path(player)
        end

        it "should decrement the followed user count" do
          expect do
            click_button "Unfollow"
          end.to change(user.players, :count).by(-1)
        end

        describe "toggling the button" do
          before { click_button "Unfollow" }
          it { should have_xpath("//input[@value='Follow']") }
        end
      end
    end
  end

end