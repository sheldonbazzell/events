class CommentsController < ApplicationController

	# create Comment object
	def create
		# call comment_params method to ensure data is restricted to
		# what is expected in Comment model
		@comment = Comment.new(comment_params)
		# if the user's inputs didn't pass the Comment model's validations, assign flash
		unless @comment.valid?
			flash[:comment_error] = @comment.errors.full_messages.to_sentence
		# else, save the Comment object, and associate to logged in user
		else
			@comment.save!
			@comment.update(user:current_user)
		end
		redirect_to "/events/#{params[:comment][:event_id]}"
	end

	private
	def comment_params
		params.require(:comment).permit(:comment, :event_id)
	end

end
