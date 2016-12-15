require 'rails_helper'
RSpec.describe UserModel do 
	describe "validating new user" do
		it "has a method that rejects creation of user with invalid form data" do 
			u1 = User.new(first_name:"", last_name:'', email:'', city:"", state:"", password:"", password_confirmation:"")
			expect(u1.valid?).to be(false)
		end
	end
end