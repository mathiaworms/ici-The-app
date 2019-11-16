module AdminsHelper

  def admin?
    unless authenticate_user! && current_user.is_admin? == true
      flash[:danger] = "Cette page est réservée aux administrateurs du site"
      redirect_to :root
    end
  end

end
