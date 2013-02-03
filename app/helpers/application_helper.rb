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

end
