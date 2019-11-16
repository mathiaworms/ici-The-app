class SearchsController < ApplicationController

  def show
    @results_pos_1 = params[:param_2]
    @results_pos_2 = params[:param_1]
    @all_event = Event.all
    end 
 
  def create
    @user = current_user
    if params['search'] == '' 
      redirect_to root_path
    else 
      @pos = Geocoder.search(params['search'])
      redirect_to search_path(@user,param_1: "#{@pos.first.coordinates[0]}", param_2: "#{@pos.first.coordinates[1]}")
    end
  end 

  def update 
    @user = current_user
    @event_find = Event.find(params[:id])
    redirect_to search_path(@user,param_1: "#{@event_find.latitude_pos}", param_2: "#{@event_find.longitude_pos}")
  end 

  def destroy 

  end
  
end
