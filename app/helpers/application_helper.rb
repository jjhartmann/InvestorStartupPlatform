module ApplicationHelper

  def header_logo
    @header_logo = HeaderLogo.last
    @header_logo ? @header_logo.logo.url : 'NetPlus_Logo.png'
  end

end
