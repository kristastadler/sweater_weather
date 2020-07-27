require 'rails_helper'

  describe "when I visit the homepage" do
    it "displays information about the Whether Sweater Weather API" do

        visit "/"
        expect(page).to have_content("Welcome to the Whether Sweater Weather API Service")
    end
  end
