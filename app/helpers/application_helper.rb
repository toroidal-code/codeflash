module ApplicationHelper

  def path_is? str
    request.path == str
  end

  def navbar_link name, path, icon=nil
    render partial: 'shared/navbar_link', locals: {
      path: path,
      name: name,
      icon: icon
    }
  end

end
