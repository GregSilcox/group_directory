class UsersController < ApplicationController
  allow_unauthenticated_access only: [ :index, :show, :new, :create, :edit, :update, :destroy ]
  before_action :set_resource, only: %i[ show edit update destroy ]

  def index
    @resources = User.all
  end

  def show
  end

  def new
    @resource = User.new
  end

  def create
    @resource = User.new(resource_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resource.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, status: :see_other, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def resource_params
    params.expect(user:
      [ :email_address, :password, :password_confirmation ])
  end

  def set_resource
    @resource = User.find(params.expect :id)
  end
end
