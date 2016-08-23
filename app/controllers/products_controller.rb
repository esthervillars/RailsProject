class ProductsController < ApplicationController
  layout "application"
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /products
  # GET /products.json
  def index

    #check rails environment and run seach form
    
    if params[:q]
      search_term = params[:q]
      if Rails.env.development?
        @products = Product.where("name LIKE ?", "%#{search_term}%").paginate(:page => params[:page], :per_page => 8)
      else
        @products = Product.where("name ilike ?", "%#{search_term}%").paginate(:page => params[:page], :per_page => 8)
      end
    else
      @products = Product.paginate(:page => params[:page], :per_page => 8)
    end
    
    
    
    #to specify another layout other than application, this can be done using render layout:

  end

  # GET /products/1
  # GET /products/1.json
  def show
    @comments = @product.comments.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to "/static_pages/landing_page", notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    #STRONG PARAMS
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :price)
    end
end
