SparkPostRails.configure do |c|
  c.api_key = '32dcfa605ada2e4cece6a633e7fedb91077d72bb'
  c.track_clicks = true                           # default: false
  c.return_path = 'hello@inp.global'  # default: nil
  c.campaign_id = 'InvitationMailers'
  c.inline_css = true                             # default: false
  c.html_content_only = true                      # default: false
end
