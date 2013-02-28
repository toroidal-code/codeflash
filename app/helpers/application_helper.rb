# Provides helper methods for the application's models, views, and controllers.
module ApplicationHelper

  # Returns true if the given path matches the path of the current page.
  #
  # @param [String] str the path to check against the current page
  #
  # @return [Boolean] true if the given path and current page path match
  def path_is? str
    request.path == str
  end

  # Renders a Bootstrap-ified navbar link with an optional icon.
  #
  # @param [String] name the name of the link, which is displayed to the user
  # @param [String] path the path that the link should bring the user to
  # @param [String] icon the name of the Bootstrap icon to display with the link
  # (excluding "icon-")
  # @param [String] method the HTTP method to use for the link
  #
  # @return [String] the generated HTML navbar link
  def navbar_link name, path, icon=nil, method='get'
    render partial: 'shared/navbar_link', locals: {
      path: path,
      name: name,
      icon: icon,
      method: method
    }
  end

  # Renders a Bootstrap-ified profile link with the user's avatar.
  #
  # @param [String] username the username of the profile's owner
  # @param [String] email the email address of the profile's owner
  # @param [String] profile_url the URL of the profile to link to
  #
  # @return [String] the generated HTML link
  def navbar_avatar username, email, profile_url
    render partial: 'shared/navbar_avatar', locals: {
      username: username,
      email: email,
      profile_url: profile_url
    }
  end

  # Returns the name of the resource to use with Devise (user).
  #
  # @return [Symbol] the symbol :user (for now)
  def resource_name
    :user
  end

  # Returns the User resource to use with Devise.
  #
  # @return [User] the existing User resource, or a new User if one does not
  # already exist
  def resource
    @resource ||= User.new
  end

  # Returns the Devise mapping for Users.
  #
  # @return [Devise::Mapping] the current Devise mapping for Users, or a new
  # Devise mapping if one does not already exist
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def paginate(collection, params= {})
    will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
  end
end
