class AccessController < ApplicationController

	before_action :check_if_logged_in, except: [:login, :attempt_login, :register, :create]

	def login
		@user = User.new
	end

	def attempt_login
		user = User.where(:username => params[:username]).first
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
			session[:user_id] = @user.id
			redirect_to root_path, notice: 'Welcome to Art!'
		else
			render 'register'
		end
	end

	def edit
		@user = User.find(session[:user_id])
	end

	def update
		@user = User.find(session[:user_id])
		if @user.update(user_params)
			redirect_to root_path, notice: 'Profile updated'
		else
			render 'edit'
		end
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end

end
