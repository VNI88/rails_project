class SessionsController < ApplicationController
  before_action :block_access, except: [:destroy]

  def new; end

  def create
    @consumer = Consumer.find_by(email: params[:session][:email].downcase)
    password = params[:session][:password]
    if @consumer && @consumer&.authenticate(password)
      sign_in @consumer
      redirect_to @consumer
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
