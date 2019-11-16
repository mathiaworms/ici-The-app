class AttendancesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @attendance = Attendance.new(event: @event, user: current_user)
    coodinate_arrays = params[:coordinatestring].to_s.split('//')
    if Geocoder.search([coodinate_arrays[0], coodinate_arrays[1]]).first.street == Geocoder.search([@event.latitude_pos, @event.longitude_pos]).first.street
      @attendance.update!(is_confirmed?: true)
      redirect_to event_path(params[:event_id])
    else
      @attendance.save
      redirect_to event_path(@event)
    end
  end

  def update
    @event = Event.find(params[:event_id])
    @attendance = Attendance.find_by(event_id: params[:event_id], user_id: current_user.id)
    coodinate_arrays = params[:coordinatestring].to_s.split('//')
    if Geocoder.search([coodinate_arrays[0], coodinate_arrays[1]]).first.street == Geocoder.search([@attendance.event.latitude_pos, @attendance.event.longitude_pos]).first.street
      @attendance.update!(is_confirmed?: true)
      redirect_to event_path(@event)
    else
      redirect_to event_path(@event)
    end
  end

  def destroy
    current_user.attendances.last.destroy!
    create 
  end
    
end
