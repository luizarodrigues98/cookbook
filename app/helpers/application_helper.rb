module ApplicationHelper

  def nav_link_class(controller)
    "nav-link px-2 link-#{controller_name == controller ? 'primary' : 'gray'}"
  end
end
