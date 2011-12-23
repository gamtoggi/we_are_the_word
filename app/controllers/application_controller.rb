# encoding: UTF-8

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, :alert => "로그인 후 사용하실수 있습니다."
  end
end
