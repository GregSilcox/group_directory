class PhonesController < ApplicationController
  allow_unauthenticated_access only: [ :index, :show, :new, :create, :edit, :update, :destroy ]
  before_action :set_resource, only: %i[ show edit update destroy ]

  # GET /phones or /phones.json
  def index
    @resources = Phone.all
  end

  # GET /phones/1 or /phones/1.json
  def show
  end

  # GET /phones/new
  def new
    @resource = Phone.new
  end

  # GET /phones/1/edit
  def edit
  end

  # POST /phones or /phones.json
  def create
    @resource = Phone.new(resource_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: "Phone was successfully created." }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phones/1 or /phones/1.json
  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: "Phone was successfully updated." }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phones/1 or /phones/1.json
  def destroy
    @resource.destroy!

    respond_to do |format|
      format.html { redirect_to phones_path, status: :see_other, notice: "Phone was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Phone.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def resource_params
      params.expect(phone: [ :number ])
    end
end
