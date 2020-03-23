module SessionsHelper
  def sign_in(consumer)
    session[:consumer_id] = consumer.id
  end

  def sign_out
    session.delete(:consumer_id)
    @current_consumer = nil
  end

  def current_consumer
    @current_consumer ||= Consumer.find_by(id: session[:consumer_id])
  end

  def block_access
    redirect_to consumers_path if current_consumer.present?
  end

  def logged_in?
    !current_consumer.nil?
  end
end
