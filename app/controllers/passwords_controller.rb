class PasswordsController < ApplicationController

  def edit
  end

  def update
    if current_user.update(set_params)
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end

  private

  def set_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end