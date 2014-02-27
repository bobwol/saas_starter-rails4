module PagesHelper
  # For passing client_side_validations with Devise, we need to define
  # the resources being used in Devise within the calling controller
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
