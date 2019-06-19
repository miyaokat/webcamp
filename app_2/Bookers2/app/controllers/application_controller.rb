class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

#ログイン後の画面遷移先を設定（確認用の一時的なもの
def after_sign_in_path_for(resource)
	user_path(current_user.id)
end

def after_sign_out_path_for(resource)
	root_path
end

protected

def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
	devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
	devise_parameter_sanitizer.permit(:account_update, keys: [:name,:introduction,:profile_image])
end

end
