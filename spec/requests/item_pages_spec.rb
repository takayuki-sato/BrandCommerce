require 'spec_helper'

describe "ItemPages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:player) { FactoryGirl.create(:player) }
  before { sign_in user }

  describe "item creation" do
    before do
      visit root_path
      visit player_path(player)
    end

    describe "with invalid information" do

      it "should not create a item" do
        expect { click_button "Post" }.not_to change(Item, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'item_description', with: "Lorem ipsum" }
      it "should create a item" do
        expect { click_button "Post" }.to change(Item, :count).by(1)
      end
    end
  end

  describe "item destruction" do
    let(:admin_user) { FactoryGirl.create(:admin) }
    before { sign_in admin_user }

    describe "as correct user" do
      before do
        visit root_path
        visit player_path(player)
      end

      it "should delete a item" do
        expect { click_link "delete" }.to change(item, :count).by(-1)
      end
    end
  end
end
