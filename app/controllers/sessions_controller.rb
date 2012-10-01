class SessionsController < Devise::SessionsController
  def create
    super
    current_user.update_attributes!( :logged_in => true )
  end

  def destroy
    current_user.update_attributes!( :logged_in => false )
    super
  end
end
