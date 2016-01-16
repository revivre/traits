class WorkTimesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  respond_to :html, :json

  def index
    @work_times = WorkTime.all
    @holiday_enum = WorkTime.holiday_enums
    @late_enum = WorkTime.late_enums
    @leave_enum = WorkTime.leave_enums
  end

  def index_month
    @holiday_enum = WorkTime.holiday_enums
    @late_enum = WorkTime.late_enums
    @leave_enum = WorkTime.leave_enums

    @year = params[:year].to_i
    @month = params[:month].to_i

    if( @year == 0 || @month == 0 )
      @work_time = WorkTime.find(params[:id])
      return
    end

    start_date = Date.new(@year,@month, 1)
    end_date   = Date.new(@year,@month, -1)
    @work_times = WorkTime.where(:work_date => start_date..end_date)
    render "work_times/index"
  end

  def edit
    @work_time = WorkTime.find(params[:id])
    @holiday_enum = WorkTime.holiday_enums
    @late_enum = WorkTime.late_enums
    @leave_enum = WorkTime.leave_enums
  end

  def update
    @work_time = WorkTime.find(params[:id])

    respond_to do |format|
      if @work_time.update_attributes(work_time_params)
        format.html { redirect_to work_times_path }
        format.json { respond_with_bip @work_time }
        flash[:success] = @work_time.work_date.to_s + 'の勤務時間が更新されました'
      else
        format.html { render action: 'edit' }
        format.json { respond_with_bip @work_time }
      end
    end
  end

  def show
    @work_time = WorkTime.find(params[:id])
    @holiday_enum = WorkTime.holiday_enums
    @late_enum = WorkTime.late_enums
    @leave_enum = WorkTime.leave_enums
  end

  def new
    @work_time = WorkTime.new
    @holiday_enum = WorkTime.holiday_enums
    @late_enum = WorkTime.late_enums
    @leave_enum = WorkTime.leave_enums
end

  def create
    @work_time = current_user.work_times.build(work_time_params)
    if @work_time.save
      flash[:success] = @work_time.work_date.to_s + 'の勤務時間が入力されました'
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def work_time_params
    params.require(:work_time).permit(:id, :user_id, :work_date,
      :start_time, :end_time, :holiday, :late, :leave, :note)
  end
end
