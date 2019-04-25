class UsersController < ApplicationController
  
  def new
  end

  def create
    email = params[:user][:email_address]
    password = params[:user][:password]
    user = User.new(email: email, password: password)
    if user.valid?
      user.save
      session[:user_id] = user.id
      flash[:success] = "New account created"
      redirect_to posts_path
    else
      flash[:success] = "Could not create account"
      redirect_to root_path
    end
  end
end
