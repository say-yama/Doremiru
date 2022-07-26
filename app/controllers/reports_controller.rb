class ReportsController < ApplicationController
  def new
    @report = Report.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @report = Report.new(report_params)
    @report.reporter_id = current_user.id
    @report.reported_id = @user.id
    if @report.save
      redirect_to user_path(@user), notice: "通報を受付いたしました。"
    else
      flash[:notice] = "エラーが発生しました"
      render "new"
    end
  end

  private

  def report_params
    params.require(:report).permit(:reason, :url, :user_id, :post_id)
  end
end
