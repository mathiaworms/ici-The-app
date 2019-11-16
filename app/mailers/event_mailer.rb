class EventMailer < ApplicationMailer
  default from: 'no-reply@ici.fr'

  def new_event(event)
    @event = event 
    @user = @event.host.alias
    @url  = 'http://www.ici.fr/login'  
    mail(to: @event.host.email, subject: 'Ton événement a été crée sur Ici !') 
  end

  def delete_event(event)
    @event = event 
    @users = @event.users
    @url  = 'http://www.ici.fr/login'
    @users.each do |user| 
      @user = user.alias
      mail(to: user.email, subject: "Un événement vient d'être annullé!") 
    end
  end

end

