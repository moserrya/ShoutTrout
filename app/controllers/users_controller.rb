class UsersController < ApplicationController
  def new
    @user = User.new
    @user.build_contact
  end

  def edit
  end

  def create
    @user = User.new user_params
    if @user.save
      respond_to do |format|
        format.html { redirect_to @user, :notice => 'User was successfully created.' }
        format.js   { render :js => "window.location.replace('#{user_path(@user)}');"}
      end
      # render status: 201, json: {link: user_url(@user)}
    else
      render status: 400, json: formatted_error_messages
    end
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
  def formatted_error_messages
    errors = @user.errors.messages
    errors.keys.each {|k| errors["user_#{k}".gsub('.', '_attributes_')] = errors.delete(k).join(', ')}
    errors
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :password, :password_confirmation, :contact_attributes => [:name, :phone_number])
  end
end
