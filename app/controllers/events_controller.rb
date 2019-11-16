class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new]
  before_action :is_host?, only: [:edit]
  before_action :delete_event_send, only: [:destroy]
  
  def new 
  end

  def index
  	@all_event = Event.all
		@results1 = -87.420679
		@results2 = 37.772537
  end 
 
  def create
    hash_of_event = params[:test]
    current_time = DateTime.now
    if params[:end_time] != ""
      if current_user.events.last != nil 
        if current_user.events.last.is_finish? == false
          current_user.events.last.destroy!
          coodinate_arrays = hash_of_event[:coordinatestring].to_s.split('//')
          event = Event.create!(longitude_pos: coodinate_arrays[1], latitude_pos: coodinate_arrays[0], host: current_user, title: hash_of_event[:title], description: hash_of_event[:description], attendees_max: params[:attendees_max], end_time: current_time + params[:end_time].to_i.minutes)  
          @attendance = Attendance.create!(event: event, user: current_user, is_confirmed?: true)
          redirect_to event_path(event.id)
        else 
          coodinate_arrays = hash_of_event[:coordinatestring].to_s.split('//')
          event = Event.create!(longitude_pos: coodinate_arrays[1], latitude_pos: coodinate_arrays[0], host: current_user, title: hash_of_event[:title], description: hash_of_event[:description], attendees_max: params[:attendees_max], end_time: current_time + params[:end_time].to_i.minutes)  
          @attendance = Attendance.create!(event: event, user: current_user, is_confirmed?: true)
          redirect_to event_path(event.id)
        end
      elsif current_user.events.last == nil
        coodinate_arrays = hash_of_event[:coordinatestring].to_s.split('//')
        event = Event.create!(longitude_pos: coodinate_arrays[1], latitude_pos: coodinate_arrays[0], host: current_user, title: hash_of_event[:title], description: hash_of_event[:description], attendees_max: params[:attendees_max], end_time: current_time + params[:end_time].to_i.minutes)  
        @attendance = Attendance.create!(event: event, user: current_user, is_confirmed?: true)
        redirect_to event_path(event.id)
      end    
    else
      redirect_to new_event_path
      flash[:error] = "La sortie doit avoir une durée"
    end 
  end 

  def show
    @event = Event.find(params[:id])
    @position = Geocoder.search([@event.latitude_pos, @event.longitude_pos])
  end

  def edit 
  	@event = Event.find(params[:id])
    @position = Geocoder.search([@event.latitude_pos, @event.longitude_pos])
  end 

  def update 
    current_time = DateTime.now
  	@event = Event.find(params[:id])
    if params[:end_time] != ""
      if params[:attendees_max].to_i >= @event.attendances.length
      	if @event.update!(title: params[:title], description: params[:description], attendees_max: params[:attendees_max], end_time: current_time + params[:end_time].to_i.minutes)  
          @event.save
          redirect_to root_path 
          flash[:success] = "Ton événement a été modifié"
        else
          redirect_to root_path
          flash[:error] = "Nous n'avons pas pu changer ton événement"
        end
      else 
        redirect_to edit_event_path(@event.id)
        flash[:error] = "Le numéro de participants ne peut pas être inférieur à #{@event.attendances.length}"
      end
    else
      redirect_to edit_event_path
      flash[:error] = "La sortie doit avoir une durée"
    end
  end 

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

end


