class Admins::ReportsController < ApplicationController
   before_action :authenticate_admin
   
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params) 
      flash[:notice] = "対応ステータスを更新しました。"
      redirect_to admins_report_path(@report)
    end
  end

private
  def report_params
  params.require(:report).permit(:status)
  end

end
