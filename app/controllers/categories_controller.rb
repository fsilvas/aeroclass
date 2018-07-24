class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def licenses
    #LISTADO DE LICENCIAS 
    lic = Category.find(params[:category_id]).category_licenses
    licenses = []
    lic.each do |l|
      licenses << [l.id, l.license.name, l.license.usd_cost, l.license.euro_cost]
    end
    if licenses
      respond_to do |format|      
        format.json {
           render :json => {error: false, licenses: licenses}
        }
      end     
    else
      respond_to do |format|      
        format.json {
           render :json => {error: true}
        }
      end
    end
  end

  def add_license
    category = Category.find(params[:category_id])
    license_id = params[:license_id]
    item = CategoryLicense.new
    item.category_id = category.id
    item.license_id = license_id
    item.save

    respond_to do |format|      
      format.json {
         render :json => {error: false, category: category}
      }
    end  
  end

  def delete_license
    category_license = CategoryLicense.find(params[:category_license_id])
    category_license.destro
    respond_to do |format|      
      format.json {
         render :json => {error: false}
      }
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :cost)
    end
end
