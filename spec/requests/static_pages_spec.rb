require 'spec_helper'

describe "StaticPages" do

  let(:base_title) { 'Closet Uniform' }
  subject { page }

  describe "Help page" do
    before { visit help_path }

    it { should have_title("#{base_title} | Help") }
    it { should have_content("Help") }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_title("#{base_title} | About Us") }
    it { should have_content("About Us") }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_title("#{base_title} | Contact") }
    it { should have_content("Contact") }
  end
end
