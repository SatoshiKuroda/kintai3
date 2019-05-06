class ApplicationController < ActionController::Base
  def authenticate_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "This area is restricted to administrators only."
      redirect_to root_path
    end
  end

  def after_sign_in_path_for(resource)
    case resource
    when User
      root_path
    when AdminUser
      #AdminUser（管理ユーザ）がログインしたときの処理
      stored_location_for(resource) ||
      if resource.is_a?(AdminUser)
        root_path
      else
        super
      end
    end
  end
end
