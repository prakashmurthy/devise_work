class SessionsController < Devise::SessionsController
  after_filter :log_failed_login, :only => :new
  def create
    super
    ::Rails.logger.info "\n***\nSuccessful login with email_id : #{request.filtered_parameters["user"]}\n***\n"
    current_user.update_attributes!( :logged_in => true )
  end

  def destroy
    current_user.update_attributes!( :logged_in => false )
    super
  end

  private
  def log_failed_login
    ::Rails.logger.info "\n***\nFailed login with email_id : #{request.filtered_parameters["user"]}\n***\n" if failed_login?
  end

  def failed_login?
    (options = env["warden.options"]) && options[:action] == "unauthenticated"
  end
end
