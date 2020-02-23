class Api::V1::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/', notice: "thank you for signing in!"
    else
      flash.now[:alert] = "wrong email or password"
      redirect_to '/SignUp'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
    # , notice: "logged out!"
  end
  private
def session_params
  params.require(:session).permit(:email, :password)
end
end
