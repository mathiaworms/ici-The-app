module EventsHelper

  def delete_event_send
    @event = Event.find(params[:id])
    EventMailer.delete_event(@event).deliver_now
  end

end
