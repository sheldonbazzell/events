class EventsController < ApplicationController
	before_action :require_login
	before_action :require_correct_user, only: [:edit, :update, :destroy]
	def index
		@events_my_state = Event.where(state:current_user.state)
		@events_not_my_state = Event.where.not(state:current_user.state)
	end

	def create 
		@event = Event.new( event_params )
		unless @event.valid?
			flash[:event_errors] = @event.errors.full_messages.to_sentence
		else
			@event.save!
			@event.update(user:current_user, state:params[:state])
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
