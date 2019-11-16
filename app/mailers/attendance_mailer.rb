class AttendanceMailer < ApplicationMailer
  default from: 'no-reply@ici.fr'
 
  def confirmation_email(attendance)
    @user = attendance.user
    @event = attendance.event
    @url  = 'http://ici.fr/' 
    if @user != @event.host
      mail(to: @user.email, subject: 'Confirmation de participation!') 
    end
  end

end
