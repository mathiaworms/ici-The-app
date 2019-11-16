class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :update]

  def index
    @user = current_user
    @events_hosted = []
    Event.all.each do |event|
      if event.host == current_user
        @events_hosted << event
      end
    end

    @events_attended = []
    Event.all.each do |event|
      event.attendances.each do |attendances|
        if attendances.user == current_user
          @events_attended << event
        end
      end
    end

  end 

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    @user.update(age_range: params[:id])
    respond_to do |format|
      format.html { redirect_to users_path }
      format.js { }
    end
  end

end
