class InvitationMailer < ApplicationMailer
  default from: 'vishalfornarola@gmail.com'

  def invitation_mail(invitation)
    @invitation = invitation
    @invitation_user_email = @invitation.enterprise.enterprise_users.first.user.email
    @url  = 'https://netpluswebapp.herokuapp.com/users/sign_in'
    mail(to: @invitation.email,from: @invitation_user_email,  subject: 'Welcome to My Awesome Site')
  end
end
