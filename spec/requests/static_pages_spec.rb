require 'spec_helper'

describe "StaticPages" do

  let(:base_title) { 'Closet Uniform' }

  describe "Help page" do
    it "should have the right title" do
      visit '/static_pages/help'
      expect(page).to have_title("#{base_title} | Help")
    end

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
  end

  describe "About page" do
    it "should have the right title" do
      visit '/static_pages/about'
      expect(page).to have_title("#{base_title}  | About Us")
    end

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end
  end

  describe "About page" do
    it "should have the right title" do
      visit '/static_pages/contact'
      expect(page).to have_title("#{base_title}  | Contact")
    end

    it "should have the content 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact')
    end
  end
end
