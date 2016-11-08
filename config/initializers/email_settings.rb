ActionMailer::Base.smtp_settings = {
    user_name:            'SMTP_Injection',
    password:             '32dcfa605ada2e4cece6a633e7fedb91077d72bb',
    address:              'smtp.sparkpostmail.com',
    port:                  587,
    enable_starttls_auto:  true,
    format:               :html,
    from:                 'postmaster@inp.global'
}
