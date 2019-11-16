class ContactReportController < ApplicationController
  before_action :admin?, only: [:index, :destroy]

  def index
  	@all_report = ConctactReport.all
  end

  def create 
  	@user = current_user
  	ConctactReport.create!(title: params[:title], content: params[:content], user: @user)
  	respond_to do |format|
      format.html { redirect_to contact_report_index_path}
      format.js { }
    end
  end 

  def destroy
    @report = ConctactReport.find(params[:id])
    @report.destroy
    respond_to do |format|
      format.html { redirect_to contact_report_index_path}
      format.js { }
    end
    flash[:notice] = "Le message a bien été supprimé !"
  end

end
