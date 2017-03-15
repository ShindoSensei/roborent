class PropertyMailer < ApplicationMailer
  default from: "roborent.contact@gmail.com"

  def property_email(user, message, property, current_user)
    @user = user
    @message = message
    @property = property
    @current_user = current_user
    mail(to: @user.email, subject: 'Inquiry on listed property')
  end
end
