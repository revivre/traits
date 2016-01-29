class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) # Not the final implementation!
    if @user.save
      log_in @user
      flash[:success] = 'User created successfully!!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to users_path }
        format.json { respond_with_bip @user }
        flash[:success] = 'Profile updated'
      else
          format.html { render action: 'edit' }
          format.json { respond_with_bip @user }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :employee_id, :password,
                                 :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
