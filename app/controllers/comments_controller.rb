class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
		unless @comment.valid?
			flash[:comment_error] = @comment.errors.full_messages.to_sentence
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
