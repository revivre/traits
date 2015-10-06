class WorkTimesController < ApplicationController

  def index
    @work_times = WorkTime.all
  end

  def edit

  end

  def show
    @work_time = WorkTime.find(params[:id])
  end

  def new
    @work_time = WorkTime.new
end

  def create
    @work_time = WorkTime.new(work_time_params)
    if @work_time.save
      redirect_to @work_time
    else
      render 'new'
    end
  end

  private

    def work_time_params
      params.require(:work_time).permit(:id, :user_id, :time)
    end
end
