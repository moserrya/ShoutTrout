class UsersController < ApplicationController
  include FormattedErrors

  def new
    @user = User.new
    @user.build_contact
  end

  def edit
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to_path user_path(@user)
    else
      render status: 400, json: format_error_messages(@user)
    end
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :password, :password_confirmation, :time_zone, :contact_attributes => [:name, :phone_number])
  end
end
