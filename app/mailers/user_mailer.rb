class UserMailer < ApplicationMailer
  default from: 'noreply'

  def welcome_email(user)
    @user = user                                              
    @url  = 'http://monsite.fr/login'                        
    #mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def confirmation_attendance_email(event_admin)
    @user = event_admin                                             
    @url  = 'http://monsite.fr/login'                               
    #mail(to: @user.email, subject: 'Confirmation de participation!') 
    puts @user
    puts @user.email
  end

end