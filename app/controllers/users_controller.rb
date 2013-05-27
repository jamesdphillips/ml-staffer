class UsersController < ApplicationController

  respond_to :html, :json

  before_filter :authenticate_user!
  before_filter :find_user, only: [:show, :edit, :update, :destroy]

  def show
    respond_with(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      respond_with(@user)
    else
      redirect_to :new
    end
  end

  def edit
  end

  def update
    @user.update_attributes(params[:user])
    respond_with(@user)
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def find_user
    @user = User.find params[:id]
  end

end
