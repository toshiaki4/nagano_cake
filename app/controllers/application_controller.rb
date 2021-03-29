class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_customer!,except: [:top, :about] ＊個別でコントローラー記入する
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  
    def after_sign_in_path_for(resource)
    # flash messageの設定
    flash[:notice] = "signed in successfully."
    case resource
    when Admin
      admin_path          #pathは設定したい遷移先へのpathを指定してください
    when Customer
      root_path              #ここもpathはご自由に変更してください
    end
    end

  def after_sign_up_path_for(resource)
    # flash messageの設定
    flash[:notice] = "signed up successfully."
    case resource
    when Admin
      admin_path          #pathは設定したい遷移先へのpathを指定してください
    when Customer
      root_path           #ここもpathはご自由に変更してください
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
     new_admin_session_path
    else
     root_path
    end
  end
  
  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :last_name_kana, :first_name_kana, :password, :postal_code, :address, :telephone_number])
    devise_parameter_sanitizer.permit(:sign_in, keys:[:password] )

  end
  
end
