class UsersController < ApplicationController

  # make sure client inputs are what is expected 
  # of User class attributes
  def create
  	@user = User.new( user_params )
  	# if inputs don't pass validations, assign flash
    unless @user.valid?
        flash[:errors] = @user.errors.full_messages.to_sentence
    		redirect_to "/users"
    # if inputs pass validations, save new user
  	else
  		@user.save!
      # store email in all lowercase to ensure case
      # insensitivty on login
      @user.update(email:params[:user][:email].downcase)
  		# set the session for the newly registered user
      session[:id] = @user.id
  		redirect_to "/events"
  	end
  end

  
  def update
    @user = current_user
    # check to see if client's update params match
    # expectations in User class
    @user.update(user_params)
    # if the inputs don't pass validations, assign flash
    if !@user.valid?
      flash[:errors] = @user.errors.full_messages.to_sentence
      redirect_to "/users/#{current_user.id}/edit"
    # if inputs pass validations, save the updates
    else
      @user.save!
      redirect_to "/events"
    end
  end

  
  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
  end
end
