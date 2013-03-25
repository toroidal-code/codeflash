# Helper for Remote link Pagination
module RemoteLinkPaginationHelper

  # A wrapper around the bootstrap link renderer that allows for for remote link
  # pagination
  class LinkRenderer < WillPaginate::ActionView::BootstrapLinkRenderer

    private

    #overriding the link renderer's link method
    def link(text, target, attributes = {})
      attributes['data-remote'] = true
      super
    end
  end
end