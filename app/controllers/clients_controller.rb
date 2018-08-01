class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all.order(name: :asc)
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Cliente creado correctamente.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        flash[:error] = @client.errors.map { |a,msg| '<li>'+msg+'</li>' }.join
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Datos actualizados correctamente.' }
        format.json { render :show, status: :ok, location: @client }
      else
        flash[:error] = @client.errors.map { |a,msg| '<li>'+msg+'</li>' }.join
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Cliente eliminado.' }
      format.json { head :no_content }
    end
  end

  def get_address
    client_id = params[:client_id]
    client = Client.find(client_id)
    respond_to do |format|      
      format.json {
         render :json => {address: client.address, comuna: client.comuna}
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :last_name, :address, :comuna, :phone)
    end
end
