class WorkTimesController < ApplicationController
  before_action :logged_in_user
  before_action :find_work_time, only: [:edit, :update, :show, :destroy]
  before_action :set_enums, only: [:index, :edit, :show, :new]
  respond_to :html, :json

  def index
    if params[:year].nil? && params[:month].nil?
      @start_date = Date.today.beginning_of_month
      @end_date   = Date.today.end_of_month
    else
      @year = params[:year].to_i
      @month = params[:month].to_i

      if @year == 0 || @month == 0
        @work_time = WorkTime.find(params[:id])
        return
      end
      @start_date = Date.new(@year, @month, 1)
      @end_date   = Date.new(@year, @month, -1)
    end
    @work_times = WorkTime.by_month(@start_date, field: :work_date)
  end

  def edit
    gon.default_start_time = Setting.start_time
    gon.default_end_time = Setting.end_time
  end

  def update
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
    gon.default_start_time = Setting.start_time
    gon.default_end_time = Setting.end_time
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

  def destroy
    @work_time.destroy
    flash[:success] = @work_time.work_date.to_s + 'の勤務時間が削除されました'
    redirect_to root_url
  end

  private

  def find_work_time
    @work_time = WorkTime.find(params[:id])
  end

  def work_time_params
    params.require(:work_time).permit(:id, :user_id, :work_date,
                                      :start_time, :end_time, :holiday, :late,
                                      :leave, :note)
  end

  def set_enums
    @holiday_enum = WorkTime.holiday_enums
    @late_enum = WorkTime.late_enums
    @leave_enum = WorkTime.leave_enums
  end
end
