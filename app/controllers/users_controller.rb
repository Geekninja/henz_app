class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy, :update]

  def index
    @users = User.all.order('created_at ASC')
  end

  def show
  end 

  def new
    @user = User.new
  end

  def create
    @user = User.new(set_params)
    if @user.save
      flash[:success] =  t :success
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    if @user.update(set_params_update)
      flash[:success] =  t :success
      redirect_to action: 'index'
    else
      render action: 'edit'
    end
  end

  def destroy
    if @user.destroy
      flash[:success] =  t :success
      redirect_to action: 'index'
    end
  end

  private

  def set_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :status, :privilege)
  end

  def set_params_update
    params.require(:user).permit(:email, :name, :status, :privilege)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
