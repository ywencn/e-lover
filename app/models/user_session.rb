class UserSession < Authlogic::Session::Base
  
  login_field(:email)
  find_by_login_method :find_by_email
  
  
end