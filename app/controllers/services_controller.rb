class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  autocomplete :client, :phone, { :display_value => "full_name", :full_model=>true, :full => true }

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    @service.service_date = @service.service_date.change(hour: @service.hour.hour, min: @service.hour.min)
    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Nuevo servicio creado.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|

      if @service.update(service_params)
        @service.service_date = @service.service_date.change(hour: @service.hour.hour, min: @service.hour.min)
        @service.save
        format.html { redirect_to @service, notice: 'Servicio actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Servicio eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:client_id, :begin_address, :begin_comuna, :end_address, :end_comuna, :hour, :service_date, :driver, :n_passenger, :n_bag, :flight, :pay_type, :status, :comment, :price)
    end
end
