class ConsumersController < ApplicationController
  def new
    @consumer = Consumer.new
  end

  def create
    @consumer = Consumer.new(consumer_params)
    if @consumer.save!
      redirect_to @consumer,
                  notice: "#{@consumer.name}, seu cadatro foi realizado com sucesso"
      sign_in(@consumer)
    else
      render action: :new
    end
  end

  def index
    @consumers = Consumer.all
  end

  def show
    @consumer = Consumer.find_by(id: params[:id])
  end

  private

  def consumer_params
    params.require(:consumer).permit(:name, :email, :password,
                                     :password_confirmation)
  end
end
