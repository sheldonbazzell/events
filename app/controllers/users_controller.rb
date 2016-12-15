class UsersController < ApplicationController
  def index
  end

  def create
  	@user = User.new( user_params )
  	unless @user.valid?
      if @user.errors.include?(:first_name) and @user.errors.include?(:last_name) and @user.errors.include?(:email) and @user.errors.include?(:city) and @user.errors.include?(:password)
        flash[:errors] = "All fields required"
      else
        flash[:errors] = @user.errors.full_messages.to_sentence
      end
    		redirect_to "/users"
  	else
  		@user.save!
      @user.update(state:params[:state], email:params[:user][:email].downcase!)
  		session[:id] = @user.id
  		redirect_to "/events"
  	end
  end

  def edit
  end

  def update
    @user = current_user
    @user.update(user_params)
    if !@user.valid?
      flash[:errors] = @user.errors.full_messages.to_sentence
      redirect_to "/users/#{current_user.id}/edit"
    else
      @user.save!
      @user.update(state:params[:state])
      redirect_to "/events"
    end
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
  end
end
