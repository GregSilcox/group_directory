class RegistrationsController < ApplicationController
  allow_unauthenticated_access only: [ :index, :show, :new, :create, :edit, :update, :destroy ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save!
      start_new_session_for(@user)
      redirect_to root_path, notice: "Signed up successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.expect(user: [ :email_address, :password, :password_confirmation ])
  end
end
