require "rails_helper"
RSpec.describe EventsController do 
	describe "creating an event" do 
		it "creates an event with valid data and displays event on index page" do 
			@user = create_user
			log_in @user
			visit "/events"
			fill_in "event[name]", with: "soccer game"
			fill_in "event[date]", with: "2016-12-18"
			fill_in "event[city]", with: "Sunnyvale"
			fill_in "event[state]", with: "CA"
			click_button "Create Event"
			expect(current_path).to eq("/events")
			expect(page).to have_text("soccer game")
		end
	end
end