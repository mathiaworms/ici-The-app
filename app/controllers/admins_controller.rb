class AdminsController < ApplicationController
  before_action :admin?, only: [:index, :create, :new]

  def index
    @events = Event.all 
  end

  def create
    current_time = DateTime.now
    coodinate_arrays = params[:coordinatestring].to_s.split('//')
    event = Event.create!(longitude_pos: coodinate_arrays[1], latitude_pos: coodinate_arrays[0], host: current_user, title: params[:title], description: params[:description], attendees_max: params[:attendees_max], end_time: current_time + (params[:end_time].to_i.minutes))
    redirect_to event_path(event.id)
  end

end
