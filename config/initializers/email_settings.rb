ActionMailer::Base.smtp_settings = {
    user_name:            'SMTP_Injection',
    password:             'd02d0c7692013d22ddc341ebfdbf77fd2843be92',
    address:              'smtp.sparkpostmail.com',
    port:                  587,
    enable_starttls_auto:  true,
    format:               :html,
    from:                 'mailer@yourawesomeapp.com'
}
