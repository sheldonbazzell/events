class AttendsController < ApplicationController
	def create 
		@event = Event.find(params[:event_id])
		Attend.create(event:@event, user:current_user)
		redirect_to "/events"
	end

	def destroy
		@event = Event.find(params[:id])
		Attend.where(event:@event, user:current_user).first.destroy
		redirect_to "/events"
	end
end
