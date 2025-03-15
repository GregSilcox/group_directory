module ResourcesController
  extend ActiveSupport::Concern

  included do
    before_action :set_resource,
      only: %i[ show edit update destroy ]

    def index
      @resources = resource_constant.all
    end

    def show
    end

    def new
      @resource = resource_constant.new
    end

    def create
      @resource = resource_constant.new resource_params

      respond_to do |format|
        if @resource.save
          format.html { redirect_to @resource,
            notice: "#{ resource_name } was successfully created." }
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
          format.html { redirect_to @resource,
            notice: "#{ resource_name } was successfully updated." }
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
        format.html { redirect_to users_path, status: :see_other,
          notice: "#{ resource_name } was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    # shared methods
    def resource_name
      @resource_name = controller_name.singularize.camelcase
    end

    def resource_constant
      resource_name.constantize
    end

    def resource_symbol
      @resource_symbol = controller_name.singularize.to_sym
    end

    def set_resource
      @resource = resource_constant.find(params.require(:id))
    end
  end
end
