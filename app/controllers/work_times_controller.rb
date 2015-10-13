class WorkTimesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

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
    @work_time = current_user.work_times.build(work_time_params)
    if @work_time.save
      flash[:success] = "WorkTime created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

    def work_time_params
      params.require(:work_time).permit(:id, :user_id, :time)
    end
end
