class WorkTimesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  respond_to :html, :json

  def index
    @work_times = WorkTime.all
  end

  def edit
    @work_time = WorkTime.find(params[:id])
  end

  def update
    @work_time = WorkTime.find(params[:id])

    respond_to do |format|
      if @work_time.update_attributes(work_time_params)
        format.html { redirect_to(@work_time,
          :notice => 'WorkTime was successfully updated.') }
        format.json { respond_with_bip(@work_time) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@work_time) }
      end
    end
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
      params.require(:work_time).permit(:id, :user_id, :start_time, :end_time)
    end
end
