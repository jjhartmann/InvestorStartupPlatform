class TestMailer < ApplicationMailer
  default from: 'vishalfornarola@gmail.com'

  def welcome_email(user)
    @user = user
    puts @user.email
    puts "___________"
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
