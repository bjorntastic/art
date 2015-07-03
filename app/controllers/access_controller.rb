class AccessController < ApplicationController

	before_action :check_if_logged_in, except: [:login, :attempt_login, :register]

	def login
		@user = User.new
	end

	def attempt_login
		user = User.where(:username => "bjorntastic").first
		if user && user.authenticate(params[:password])
			session[:username] = user.username
			session[:user_id] = user.id
			redirect_to root_url, notice: 'You are now logged in. Have fun!'
		else
			redirect_to '/login', notice: 'Invalid username / password.'
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to root_url, notice: 'You are now logged out.'
	end

	def register
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_url, notice: 'Welcome to Art!'
		else
			render 'register'
		end
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end

end
