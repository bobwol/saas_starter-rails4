require 'spec_helper'

describe "Static pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Tired of manual tasks?') }
    it { should have_title(full_title('')) }
    it { should_not have_title('Home |') }
  end

  describe "About page" do
    before { visit page_path('about') }

    it { should have_content('About Us') }
    it { should have_title(full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit page_path('contact') }

    it { should have_selector('h2', text: 'Contact Us') }
    it { should have_title(full_title('Contact Us')) }
  end
end
