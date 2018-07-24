class CategoryLicensesController < ApplicationController
  before_action :set_category_license, only: [:show, :edit, :update, :destroy]

  # GET /category_licenses
  # GET /category_licenses.json
  def index
    @category_licenses = CategoryLicense.all
  end

  # GET /category_licenses/1
  # GET /category_licenses/1.json
  def show
  end

  # GET /category_licenses/new
  def new
    @category_license = CategoryLicense.new
  end

  # GET /category_licenses/1/edit
  def edit
  end

  # POST /category_licenses
  # POST /category_licenses.json
  def create
    @category_license = CategoryLicense.new(category_license_params)

    respond_to do |format|
      if @category_license.save
        format.html { redirect_to @category_license, notice: 'Category license was successfully created.' }
        format.json { render :show, status: :created, location: @category_license }
      else
        format.html { render :new }
        format.json { render json: @category_license.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_licenses/1
  # PATCH/PUT /category_licenses/1.json
  def update
    respond_to do |format|
      if @category_license.update(category_license_params)
        format.html { redirect_to @category_license, notice: 'Category license was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_license }
      else
        format.html { render :edit }
        format.json { render json: @category_license.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_licenses/1
  # DELETE /category_licenses/1.json
  def destroy
    @category_license.destroy
    respond_to do |format|
      format.html { redirect_to category_licenses_url, notice: 'Category license was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_license
      @category_license = CategoryLicense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_license_params
      params.require(:category_license).permit(:category_id, :license_id)
    end
end
