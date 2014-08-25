class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  helper_method :current_user

  private

  def client
    customer = OAuth::Consumer.new("EN_CONSUMER_KEY", "EN_CONSUMER_SECRET",{
    :site=>"https://sandbox.evernote.com/",
    :request_token_path => "/oauth",
    :access_token_path => "/oauth",
    :authorize_path => "/OAuth.action"})
    @request_token = customer.get_request_token(:oauth_callback => "http://localhost:3000/create_evernote_step_2")

    session[:request_token] = @request_token.token
    session[:request_token_secret] = @request_token.secret       

    redirect_to @request_token.authorize_url
    access_token = @request_token.get_access_token(:oauth_verifier => oauth_verifier)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
