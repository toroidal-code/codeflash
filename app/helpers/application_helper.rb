module ApplicationHelper

  def path_is? str
    request.path == str
  end

  def navbar_link name, path, icon=nil, method='get'
    render partial: 'shared/navbar_link', locals: {
      path: path,
      name: name,
      icon: icon,
      method: method
    }
  end

  def navbar_avatar username, email, profile_url
    render partial: 'shared/navbar_avatar', locals: {
      username: username,
      email: email,
      profile_url: profile_url
    }
  end

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
