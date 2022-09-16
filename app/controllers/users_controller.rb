class UsersController < ApplicationController
  before_action :authenticate_user!
  # Shwo all users:
  # /users or /users.json
  def index
    @users = User.all
  end

  # Show user by their id:
  # /1 or /1.json
  def show
    @user = User.find(params[:id])
  end

  # Create new user/new
  def new
    @user = User.new
  end

  # Edit use by their id
  # /1/edit
  def edit; end

  # Create new user:
  # /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  # Delete user by their id
  # /1 or /1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
