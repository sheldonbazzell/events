class EventsController < ApplicationController
	
	# restrict event creation to logged in users
	before_action :require_login
	# restrict event edits to corresponding user object
	before_action :require_correct_user, only: [:edit, :update, :destroy]
	
	# assign necessary data to be displayed on Events page to instance variables
	def index
		@events_my_state = Event.where(state:current_user.state)
		@events_not_my_state = Event.where.not(state:current_user.state)
	end

	# create Event object
	def create
		# verify params sent to controller are the relevant attributes
		# for the Event class
		@event = Event.new( event_params )
		# if not, assign flash
		unless @event.valid?
			flash[:event_errors] = @event.errors.full_messages.to_sentence
		# if so, save the event object
		else
			@event.save!
			@event.update(user:current_user)
			users = User.all
		end
		redirect_to "/events"
	end

	
	def show
		@event = Event.find(params[:id])
	end

	
	def edit
		@event = Event.find(params[:id])
	end

	
	def update
		Event.find(params[:id]).update(event_params)
		redirect_to "/events"
	end

	
	def destroy
		Event.find(params[:id]).destroy
		redirect_to "/events"
	end

	
	private
	def event_params
		params.require(:event).permit(:name, :date, :city)
	end

end
