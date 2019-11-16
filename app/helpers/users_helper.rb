module UsersHelper

  def user_age
    @user = current_user
    @age = ((Time.now.to_i - @user.birthday.to_i) / 1.year.seconds).floor
    return @age
  end

  def age_range_min
    @user_age = user_age
    @user = current_user
    if user_age-@user.age_range < 18
      return 18
    else
      return user_age-@user.age_range
    end
  end

  def age_range_max
    @user_age = user_age
    @user = current_user
    user_age+@user.age_range
  end

  def is_host?
    @event = Event.find(params[:id])
    unless authenticate_user! && @event.host == current_user || current_user.is_admin?
      flash[:danger] = "Cette page est réservée aux créateur de l'événement"
      redirect_to :root
    end
  end

end
