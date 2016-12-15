class SessionsController < ApplicationController

	def create
		@user = User.where(email:params[:user][:email].downcase!).first
		if @user
			@user.authenticate(params[:user][:password])
			session[:id] = @user.id
			redirect_to "/events"
		else
			flash[:login_errors] = "Invalid email / password"
			redirect_to "/users"
		end
	end

	def destroy
		reset_session
		redirect_to "/events"
	end
end
