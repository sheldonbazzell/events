class AttendsController < ApplicationController
	
	# per hidden form params for event_id, instantiate Attend class
	# with logged in user and corresponding event object
	def create 
		@event = Event.find(params[:event_id])
		Attend.create(event:@event, user:current_user)
		redirect_to "/events"
	end
	
	# per url params for event id, cancel rsvp (destroy Attend object)
	# containing logged in user's id and event's id
	def destroy
		@event = Event.find(params[:id])
		Attend.where(event:@event, user:current_user).first.destroy
		redirect_to "/events"
	end
end
