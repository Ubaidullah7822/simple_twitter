class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
      #login success redirect
    else
      #create error message
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  render 'new'
  def new
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
