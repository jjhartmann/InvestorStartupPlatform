module ApplicationHelper

  def header_logo
    @header_logo = HeaderLogo.last
    @header_logo ? @header_logo.logo.url : "/assets/Handshake-shaking-hands-hand-shake-clip-art-clipart-image-image.jpeg"
  end

end
